class CreateBlogelatorPosts < ActiveRecord::Migration
  def change
    create_table :blogelator_posts do |t|
      # Associations
      t.belongs_to :author, index: true

      # Attributes
      t.text       :body_html
      t.text       :body_markdown
      t.boolean    :featured
      t.attachment :image
      t.string     :meta_description
      t.string     :meta_keywords
      t.datetime   :published_at
      t.string     :slug, index: true
      t.integer    :status, default: 0
      t.text       :summary_html
      t.text       :summary_markdown
      t.string     :title

      t.timestamps null: false
    end
  end
end
