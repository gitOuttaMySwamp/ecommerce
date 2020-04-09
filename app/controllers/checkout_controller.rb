# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    piece = Piece.find(params[:id])

    if piece.nil?
      redirect_to root_path
      return
    end

    # Setting up a Strip session for payment.
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: piece.name,
        description: "Size: #{piece.size.description} Detail: #{piece.detail.description}",
        amount: (piece.size.price.to_i + piece.detail.price.to_i) * 100,
        currency: 'cad',
        quantity: 1
      }],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def invoice

    base_uri 'http://api.salestaxapi.ca/v2/'

    @cart = Piece.find(session[:cart])

    @subtotal = 0
    @cart.each do |piece|
      @subtotal += (piece.size.price + piece.detail.price)
    end
    @total = @subtotal
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    redirect_to root_path
  end
end
