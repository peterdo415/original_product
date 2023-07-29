class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.integer :point
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
