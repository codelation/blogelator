# This migration comes from blogelator (originally 20140221192000)
class CreateBlogelatorPosts < ActiveRecord::Migration
  def change
    create_table :blogelator_posts do |t|
      t.string :title
      t.integer :user_id
      t.text :body_html
      t.text :body_markdown

      t.timestamps
    end
  end
end
