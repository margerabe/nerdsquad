class GamesController < ApplicationController
  def new
    @game = Game.new
    @game.user = current_user
    @board = Board.new
    @dice = Dice.new
    @piece = Piece.new
    @token = Token.new
  end

  def create
    @game = Game.new(game_params)
    @user = current_user
    @board = Board.new
    @game.user = @user
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @board = Board.new
  end

  def edit
    @game = Game.find(game_params)
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      flash[:success] = "Game was successfully updated"
      redirect_to @game
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def preview
    @game = Game.find(params[:game_id])
  end

  private

  def game_params
    params.require(:game).permit(:number_of_players, :name, :description)
  end
end
