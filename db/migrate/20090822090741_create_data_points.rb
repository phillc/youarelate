class CreateDataPoints < ActiveRecord::Migration
  def self.up
    create_table :data_points do |t|
      t.datetime :expected_time
      t.datetime :actual_time
      t.integer :time_difference
      t.references :person

      t.timestamps
    end
  end

  def self.down
    drop_table :data_points
  end
end
