class AddDeadlineOptionToFavours < ActiveRecord::Migration[5.0]
  def change
    add_column :favours, :deadline_option, :integer
  end
end
