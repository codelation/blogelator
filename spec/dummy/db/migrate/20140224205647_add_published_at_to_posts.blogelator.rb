# This migration comes from blogelator (originally 20140224192058)
class AddPublishedAtToPosts < ActiveRecord::Migration
  def up
    add_column :blogelator_posts, :published_at, :datetime
    Blogelator::Post.all.each do |post|
      post.published_at = post.created_at
      post.save
    end
  end
  
  def down
    remove_column :blogelator_posts, :published_at
  end
end
