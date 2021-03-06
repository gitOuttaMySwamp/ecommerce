# frozen_string_literal: true

class PiecesController < ApplicationController
  before_action :set_piece, only: %i[show edit update destroy]
  before_action :setup_session
  before_action :increment_visit_count, only: %i[index]

  # GET /pieces
  # GET /pieces.json
  def index
    @pieces = Piece.search(params[:search], params[:size], params[:page])
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end

  # GET /pieces/1/edit
  def edit; end

  # GET /pieces/1
  # GET /pieces/1.json
  def show; end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    @cart = Piece.find(session[:cart])
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  # # POST /pieces
  # # POST /pieces.json
  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: "Piece was successfully created." }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /pieces/1
  # # PATCH/PUT /pieces/1.json
  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: "Piece was successfully updated." }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /pieces/1
  # # DELETE /pieces/1.json
  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url, notice: "Piece was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def setup_session
    session[:visit_count] ||= 0
    session[:cart] ||= []
    @cart = Piece.find(session[:cart])
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_piece
    @piece = Piece.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def piece_params
    params.require(:piece).permit(:name, :sizeId, :detailId, :dimensions)
  end
end
