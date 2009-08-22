class CreateDatas < ActiveRecord::Migration
  def self.up
    create_table :datas do |t|
      t.datetime :expected_time
      t.datetime :actual_time
      t.datetime :time_difference

      t.timestamps
    end
  end

  def self.down
    drop_table :datas
  end
end
