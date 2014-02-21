class CreateBlogelatorTags < ActiveRecord::Migration
  def change
    create_table :blogelator_tags do |t|
      t.string :name
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
