class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :link_page
      t.string :name
      t.string :url, limit: 2048
      t.timestamps
    end

    add_foreign_key :links, :link_pages
  end
end
