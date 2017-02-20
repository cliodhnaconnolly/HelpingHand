class AddLocationBooleanToFavours < ActiveRecord::Migration[5.0]
  def change
    add_column :favours, :use_location, :boolean
  end
end
