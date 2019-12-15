# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.page(params[:page])
    @board = Board.new
  end

  def new
    @board = Board.new
  end

  def show
    @response = Response.new
    @responses = @board.responses.page(params[:page])
  end

  def create
    @board = Board.new(board_params)

    if @board.valid?
      @board.save!
      redirect_to boards_path
    else
      @boards = Board.all
      render 'index'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:name)
  end
end
