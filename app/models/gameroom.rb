class Gameroom < ApplicationRecord
    has_many :messages
    belongs_to :game
end
