class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :blogelator_posts, :summary, :text, default: "", null: false
    
    Blogelator::Post.all.each do |post|
      post.save!
    end
  end
end
