class AddLocationToHike < ActiveRecord::Migration[7.0]
  def change
    add_column :hikes, :start_latitude, :float
    add_column :hikes, :start_longitude, :float
  end
end
