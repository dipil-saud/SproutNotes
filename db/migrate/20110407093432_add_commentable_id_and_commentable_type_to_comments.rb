class AddCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    remove_column :comments, :how_to_id
  end

  def self.down
    remove_column :comments, :commentable_type
    remove_column :comments, :commentable_id
    add_column :comments, :how_to_id, :integer
  end
end
