class CreateBlogelatorTags < ActiveRecord::Migration
  def change
    create_table :blogelator_tags do |t|
      t.string :name
      t.string :slug, index: true

      t.timestamps null: false
    end
  end
end
