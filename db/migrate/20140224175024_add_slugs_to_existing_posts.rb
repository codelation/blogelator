class AddSlugsToExistingPosts < ActiveRecord::Migration
  def up
    Blogelator::Post.all.each do |post|
      post.slug = post.title.parameterize
      existing_slug_count = post.class.where(slug: post.slug).count
      if existing_slug_count > 0
        post.slug = post.slug + "-#{existing_slug_count}"
      end
      post.save
    end
  end
  
  def down
    # Do nothing
  end
end
