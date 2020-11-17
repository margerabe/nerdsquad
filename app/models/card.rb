class Card < ApplicationRecord
  belongs_to :card_deck
  has_one_attached :photo
end
