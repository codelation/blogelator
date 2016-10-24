class CreateBlogelatorPostsPosts < ActiveRecord::Migration
  def change
    create_table :blogelator_posts_posts do |t|
      t.belongs_to :post,         index: true
      t.belongs_to :related_post, index: true
    end
  end
end
