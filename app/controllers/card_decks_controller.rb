class CardDecksController < ApplicationController
  before_action :set_game, only: %i[new create show edit update]
  before_action :set_deck, only: %i[show edit update]

  def new
    @card_deck = CardDeck.new
  end

  def create
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

  def show
    @card = @card_deck.cards.first
  end

  def edit; end

  def update
    @card_deck.update!(card_deck_params)
    @card_deck.cards.each do |card|
      card.posX = @card_deck.posX
      card.posY = @card_deck.posY + card.position * 40
      card.angle = @card_deck.angle
      card.save
    end
    redirect_to request.referrer
  end

  private

  def card_deck_params
    params.require(:card_deck).permit(:name, :posX, :posY, :width, :height, :angle, :blind?)
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_deck
    @card_deck = CardDeck.find(params[:id])
  end
end
