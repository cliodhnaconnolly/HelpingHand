class AddUserRefToFavours < ActiveRecord::Migration[5.0]
  def change
    add_reference :favours, :user, foreign_key: true
  end
end
