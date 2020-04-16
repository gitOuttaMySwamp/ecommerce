# frozen_string_literal: true

require 'json'
require 'repost'

class CheckoutController < ApplicationController
  def create
    pieces = Piece.where(id: params[:id_array])

    if pieces.nil?
      redirect_to root_path
      return
    end

    items_hash = []
    pieces.each do |piece|
      product_price = piece.size.price.to_f + piece.detail.price.to_f

      items_hash << {
        name: piece.name,
        description: "Size: #{piece.size.description} Detail: #{piece.detail.description}",
        amount: (product_price * 100).round.to_i,
        # amount: product_price.to_i,
        currency: 'cad',
        quantity: 1
      }
    end

    items_hash << {
      name: 'GST',
      description: "#{current_user.province.name} Provincial Sales Tax",
      amount: (params[:gst_amount].to_f * 100).round.to_i,
      currency: 'cad',
      quantity: 1
    }

    items_hash << {
      name: 'PST',
      description: 'Federal Goods and Services Tax',
      amount: (params[:pst_amount].to_f * 100).round.to_i,
      currency: 'cad',
      quantity: 1
    }

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: items_hash,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js
    end
  end

  def invoice
    @cart = Piece.find(session[:cart])

    @id_array = []
    @cart.each do |piece|
      @id_array << piece.id
    end

    @subtotal = 0
    @cart.each do |piece|
      @subtotal += (piece.size.price + piece.detail.price)
    end

    sales_tax = SalesTax.new
    gst_response = JSON.parse(sales_tax.gst.body)
    pst_response = JSON.parse(sales_tax.pst(current_user.province.code).body)

    @gst = gst_response['gst'].to_f
    @pst = pst_response['pst'].to_f
    @hst = pst_response['hst'].to_f

    @total = @subtotal + (@gst * @subtotal) + (@pst * @subtotal)
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    total_amount = 0
    total_tax = 0
    id_array = []

    session_p = JSON.parse(@session.to_s)

    session_p['display_items'].each do |item|
      total_amount += (item['amount'].to_i / 100.00)

      if item['custom']['name'].to_s.eql?('GST') || item['custom']['name'].to_s.eql?('PST')
        total_tax += (item['amount'].to_i / 100.00)
      else
        piece = Piece.where(name: item['custom']['name']).first
        id_array << piece.id unless piece.nil?
      end
    end

    repost(order_create_path, params: {
             pieces: id_array,
             total: total_amount,
             tax: total_tax
           }, options: { authenticity_token: :auto })
  end

  def cancel
    redirect_to root_path
  end
end
