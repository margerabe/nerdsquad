class AddNameToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :name, :string
  end
end
