class BoardsController < ApplicationController
  def new
    @board = Board.new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @board = Board.new(board_params)
    @board.game = @game
    if @board.save
      redirect_to game_board_path(params[:game_id],@board.id)
    else
      render 'games/new'
    end
  end

  def show
    @game = Game.find(params[:game_id])
    @board = Board.find(params[:id])
    @game = Game.find(params[:game_id])
  end

  private

  def board_params
    params.require(:board).permit(:photo)
  end
end
