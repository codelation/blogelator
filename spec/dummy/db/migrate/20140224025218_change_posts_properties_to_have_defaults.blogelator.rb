# This migration comes from blogelator (originally 20140224024607)
class ChangePostsPropertiesToHaveDefaults < ActiveRecord::Migration
  def change
    Blogelator::Post.all.each do |post|
      post.title = post.title.to_s
      post.body_html = post.body_html.to_s
      post.body_markdown = post.body_markdown.to_s
      post.save
    end
    
    change_column :blogelator_posts, :title, :string, default: "", null: false
    change_column :blogelator_posts, :body_html, :text, default: "", null: false
    change_column :blogelator_posts, :body_markdown, :text, default: "", null: false
  end
end
