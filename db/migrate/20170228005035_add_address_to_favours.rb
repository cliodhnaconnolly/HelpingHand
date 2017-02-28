class AddAddressToFavours < ActiveRecord::Migration[5.0]
  def change
    add_column :favours, :address, :string
  end
end
