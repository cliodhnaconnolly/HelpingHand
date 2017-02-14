class AddLocationToFavours < ActiveRecord::Migration[5.0]
  def change
    add_column :favours, :lat, :float
    add_column :favours, :long, :float
    add_column :favours, :address, :string
  end
end
