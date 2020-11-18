class CardsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @card_deck = CardDeck.find(params[:card_deck_id])
    @card = Card.new
  end

  def create
    @game = Game.find(params[:game_id])
    @card_deck = CardDeck.find(params[:card_deck_id])
    @card = Card.new(card_params)
    @card.card_deck = @card_deck
    if @card.save
      flash[:success] = "Card successfully created"
      redirect_to game_card_deck_path(@game, @card_deck)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end

    def show
      @card_deck = CardDeck.find(params[:card_deck_id])
    end
  end

  private

  def card_params
    params.require(:card).permit(:photo, :name)
  end
end
