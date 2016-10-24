class CreateBlogelatorAuthors < ActiveRecord::Migration
  def change
    create_table :blogelator_authors do |t|
      # Associations
      t.belongs_to :user, index: true, polymorphic: true

      # Attributes
      t.text       :bio_html
      t.text       :bio_markdown
      t.attachment :cover_photo
      t.string     :location
      t.string     :meta_description
      t.string     :meta_keywords
      t.string     :name
      t.attachment :profile_photo
      t.string     :slug, index: true
      t.string     :website

      t.timestamps null: false
    end
  end
end
