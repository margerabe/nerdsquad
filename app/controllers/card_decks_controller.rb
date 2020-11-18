class CardDecksController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @card_deck = CardDeck.new
  end

  def create
    @game = Game.find(params[:game_id])
    @card_deck = CardDeck.new(card_deck_params)
    @card_deck.game = @game
    if @card_deck.save
      flash[:success] = "Card deck successfully created"
      redirect_to new_game_card_deck_card_path(@game, @card_deck)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit 
    @game = Game.find(params[:game_id])
  end

  private

  def card_deck_params
    params.require(:card_deck).permit(:name)
  end

  
end
