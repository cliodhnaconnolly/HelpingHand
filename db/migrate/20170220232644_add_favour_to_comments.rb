class AddFavourToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :favour, foreign_key: true
  end
end
