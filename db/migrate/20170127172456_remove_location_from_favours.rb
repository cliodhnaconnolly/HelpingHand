class RemoveLocationFromFavours < ActiveRecord::Migration[5.0]
  def change
    remove_column :favours, :latitude, :float
    remove_column :favours, :longitude, :float
    remove_column :favours, :address, :string
  end
end
