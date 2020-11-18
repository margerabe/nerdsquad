class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def create
    @game = Game.find(params[:game_id])
    @piece = Piece.new(piece_params)
    @piece.game = @game
    if @piece.save
      flash[:success] = "Piece successfully created"
      redirect_to game_path(@game)
    else
      flash[:error] = "Something went wrong"
      redirect_to new_game_piece_path(@game)
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:photo)
  end
end
