# frozen_string_literal: true

require 'json'

class CheckoutController < ApplicationController
  def create
    pieces = Piece.where(id: params[:id])

    if pieces.nil?
      redirect_to root_path
      nil
    end

    #   items_hash = []
    #   pieces.each do |piece|
    #     items_hash << {
    #       name: piece.name,
    #       description: "Size: #{piece.size.description} Detail: #{piece.detail.description}",
    #       amount: ((piece.size.price.to_i + piece.detail.price.to_i) + ((piece.size.price.to_i + piece.detail.price.to_i) * @gst) + ((piece.size.price.to_i + piece.detail.price.to_i) * @pst) + ((piece.size.price.to_i + piece.detail.price.to_i) * @hst) * 100),
    #       currency: 'cad',
    #       quantity: 1
    #     }
    #   end

    #   @session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     line_items: items_hash,
    #     success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
    #     cancel_url: checkout_cancel_url
    #   )

    #   respond_to do |format|
    #     format.js # render create.js.erb
    #   end
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

    @total = @subtotal + (@gst * @subtotal) + (@pst * @subtotal) + (@hst * @subtotal)
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    redirect_to root_path
  end
end
