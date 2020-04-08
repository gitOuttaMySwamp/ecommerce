# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    @product = Piece.find(params[:id])

    if @product.nil?
      redirect_to root_path
      return
    end

    # Setting up a Strip session for payment.
    

    respond_to do |format|
      format.js # render create.js.erb
    end
  end

  def success; end

  def cancel; end
end
