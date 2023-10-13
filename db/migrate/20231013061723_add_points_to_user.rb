class AddPointsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :points,     :integer, default: 50
    add_column :users, :role,       :integer, default: 0
    add_column :users, :difficulty, :integer, default: 0
  end
end
