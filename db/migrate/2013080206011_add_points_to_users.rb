class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :decimal, :default => 0.00
  end
end
