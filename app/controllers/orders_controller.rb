# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(
      user: current_user,
      pieces: Piece.where(id: params[:pieces]),
      amount: params[:total],
      tax: params[:tax],
      paid: params[:paid],
      stripeId: params[:stripe_id]
    )
    @order.save
    respond_to { |format| respond_to_create(format) }
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.permit(:productId, :amount)
  end

  def respond_to_create(format)
    if @order.save
      format.html { redirect_to @order, notice: "Order was successfully created." }
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end
