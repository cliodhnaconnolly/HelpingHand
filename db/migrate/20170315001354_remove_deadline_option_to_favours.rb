class RemoveDeadlineOptionToFavours < ActiveRecord::Migration[5.0]
  def change
    remove_column :favours, :deadline_option, :integer
  end
end
