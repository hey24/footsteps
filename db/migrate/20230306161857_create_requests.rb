class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.boolean :request_accepted, default: false
      t.boolean :request_pending, default: true
      t.references :user, foreign_key: true
      t.references :hike, foreign_key: true

      t.timestamps
    end
  end
end
