class Token < ApplicationRecord
  belongs_to :game
  has_one_attached :photo
end
