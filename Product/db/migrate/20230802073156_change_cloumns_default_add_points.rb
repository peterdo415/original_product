class ChangeCloumnsDefaultAddPoints < ActiveRecord::Migration[7.0]
  def change
    change_column :points, :point, :integer, default: 0
  end
end
