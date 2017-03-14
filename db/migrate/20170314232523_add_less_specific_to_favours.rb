class AddLessSpecificToFavours < ActiveRecord::Migration[5.0]
  def change
    add_column :favours, :less_specific_location, :boolean
  end
end
