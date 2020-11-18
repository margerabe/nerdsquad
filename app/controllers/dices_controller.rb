class DicesController < ApplicationController
  def new
    @dice = Dice.new
  end

  def create
    @game = Game.find(params[:game_id])
    @dice = Dice.new(dice_params)
    @dice.game = @game
    if @dice.save
      flash[:success] = "Dice(s) successfully created"
      redirect_to game_path(@game)
    else
      flash[:error] = "Something went wrong"
      redirect_to new_game_piece_path(@game)
    end
  end

  private

  def dice_params
    params.require(:dice).permit(:faces)
  end
end
