# This migration comes from blogelator (originally 20140303015004)
class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :blogelator_posts, :summary, :text, default: "", null: false
  end
end
