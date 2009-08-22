class ChangeDataExpectedActualNullTrue < ActiveRecord::Migration
  def self.up
    change_column :datas, :expected_time, :datetime, :null => true;
    change_column :datas, :actual_time, :datetime, :null => true;
  end

  def self.down
    change_column :datas, :expected_time, :datetime, :null => false;
    change_column :datas, :actual_time, :datetime, :null => false;
  end
end
