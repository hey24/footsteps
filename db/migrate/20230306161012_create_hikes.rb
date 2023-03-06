class CreateHikes < ActiveRecord::Migration[7.0]
  def change
    create_table :hikes do |t|
      t.string :hike_name
      t.text :hike_description
      t.string :hike_photo_url
      t.string :difficulty
      t.float :distance
      t.interval :duration
      t.integer :max_people
      t.date :hike_date
      t.boolean :hike_confirmed, default: false
      t.boolean :hike_completed, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
