# This migration comes from blogelator (originally 20140221204230)
class AddSlugAndChangeUserToAuthor < ActiveRecord::Migration
  def change
    add_column :blogelator_posts, :slug, :string
    rename_column :blogelator_posts, :user_id, :author_id
  end
end
