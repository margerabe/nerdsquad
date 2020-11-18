class AddUserRefToGamerooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :gamerooms, :user, null: false, foreign_key: true
  end
end
