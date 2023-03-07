class AddStartingPointToHikes < ActiveRecord::Migration[7.0]
  def change
    add_column :hikes, :starting_point, :string
  end
end
