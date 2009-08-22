class AddPersonIdToData < ActiveRecord::Migration
  def self.up
    add_column :datas, :person_id, :integer
  end

  def self.down
    remove_column :datas, :person_id
  end
end
