class AddCommentableToComments < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string

    remove_column :comments, :post_id
  end

  def down
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type

    add_column :comments, :post_id
  end
end
