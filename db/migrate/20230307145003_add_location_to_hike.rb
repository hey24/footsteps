class AddLocationToHike < ActiveRecord::Migration[7.0]
  def change
    add_column :hikes, :latitude, :float
    add_column :hikes, :longitude, :float
  end
end
