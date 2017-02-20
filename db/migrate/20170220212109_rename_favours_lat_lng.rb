class RenameFavoursLatLng < ActiveRecord::Migration[5.0]
  def change
    rename_column :favours, :lat, :latitude
    rename_column :favours, :long, :longitude
  end
end
