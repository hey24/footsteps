class AddHikeToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :hike, null: false, foreign_key: true
  end
end
