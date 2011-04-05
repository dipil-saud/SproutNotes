class AddUserIdToHowTo < ActiveRecord::Migration
  def self.up
    add_column :how_tos, :user_id, :integer
  end

  def self.down
    remove_column :how_tos, :user_id
  end
end
