class DropPoints < ActiveRecord::Migration[7.0]
  def change
    drop_table :points do |t|
      t.integer "point", default: 0
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_points_on_user_id"

      t.timestamps
    end
  end
end
