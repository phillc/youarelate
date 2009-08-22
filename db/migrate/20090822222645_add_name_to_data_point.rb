class AddNameToDataPoint < ActiveRecord::Migration
  def self.up
    add_column :data_points, :name, :string
  end

  def self.down
    remove_column :data_points, :name
  end
end
