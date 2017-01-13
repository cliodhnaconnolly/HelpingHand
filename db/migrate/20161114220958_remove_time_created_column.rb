class RemoveTimeCreatedColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :favours, :time_created, :datatime
  end
end
