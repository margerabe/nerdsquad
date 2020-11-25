class CardsController < ApplicationController
  before_action :set_game, only: %i[new create update destroy]
  before_action :set_card_deck, only: %i[new create show update destroy]
  before_action :set_card, only: %i[destroy update]

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.assign_attributes(card_deck: @deck, height: @deck.height, width: @deck.width,
                            posX: @deck.posX, posY: @deck.posY, angle: @deck.angle)
    @card.position = @deck.cards.count + 1
    if @card.save && @deck.cards.count > 1
      redirect_to @game
    else
      redirect_to game_card_deck_path(@game, @deck)
    end
  end

  def update
    @card.update!(card_params)
  end

  def show; end

  def destroy
    @card.destroy
    @deck.destroy if @deck.cards.empty?
    redirect_to @game
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_card_deck
    @deck = CardDeck.find(params[:card_deck_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:photo, :name, :position, :posX, :posY, :width, :height, :angle, :visibility)
  end
end
