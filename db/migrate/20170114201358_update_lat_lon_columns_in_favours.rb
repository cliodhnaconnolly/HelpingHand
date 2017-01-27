class UpdateLatLonColumnsInFavours < ActiveRecord::Migration[5.0]
  def change
    change_column :favours, :latitude, :float
    change_column :favours, :longitude, :float
    add_column :favours, :address, :string
  end
end
