class AddColumnToCardDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :card_decks, :name, :string
  end
end
