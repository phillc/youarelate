class RemoveOld < ActiveRecord::Migration
  def self.up
    drop_table :sessions
    drop_table :users
    drop_table :open_id_authentication_nonces
    drop_table :open_id_authentication_associations
  end

  def self.down
  end
end
