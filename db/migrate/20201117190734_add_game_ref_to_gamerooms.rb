class AddGameRefToGamerooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :gamerooms, :game, null: false, foreign_key: true
  end
end
