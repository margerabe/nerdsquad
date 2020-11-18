class AddTheGameRefToGamerooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :gamerooms, :game, foreign_key: true
  end
end
