class CreateFavours < ActiveRecord::Migration[5.0]
  def change
    create_table :favours do |t|
      t.string :creator
      t.string :title
      t.string :description
      t.datetime :deadline
      t.datetime :time_created
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
