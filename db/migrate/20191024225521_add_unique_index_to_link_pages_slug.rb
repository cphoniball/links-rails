class AddUniqueIndexToLinkPagesSlug < ActiveRecord::Migration[6.0]
  def change
    change_table :link_pages do |t|
      t.index :slug, unique: true
    end
  end
end
