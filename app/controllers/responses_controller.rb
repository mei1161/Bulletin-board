class ResponsesController < ApplicationController

def create
  @board = Board.find(params[:response][:board_id])
  @response = @board.responses.create(response_params)
  redirect_to board_path(@board)
end


  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def response_params
    params.require(:response).permit(:name, :content, :email)
  end
end