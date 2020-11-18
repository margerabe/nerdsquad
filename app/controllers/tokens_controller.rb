class TokensController < ApplicationController
  def new
    @token = Token.new
  end

  def create
    @game = Game.find(params[:game_id])
    @token = Token.new(token_params)
    @token.game = @game
    if @token.save
      flash[:success] = "Token successfully created"
      redirect_to game_path(@game)
    else
      flash[:error] = "Something went wrong"
      render 'new' 
    end
  end 
  
  private

  def token_params
    params.require(:token).permit(:photo, :name)
  end
end
