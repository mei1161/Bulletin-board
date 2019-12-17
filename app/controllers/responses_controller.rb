class ResponsesController < ApplicationController

  def create
    @board = Board.find(params[:response][:board_id])
    @response = @board.responses.new(response_params)
    @response.ipaddress = request.remote_ip
    if @response.valid?
      @response.save!
      redirect_to board_path(@board)
    else
      render 'boards/show'
    end
    
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def response_params
    params.require(:response).permit(:name, :content, :email)
  end
end