class CreateLinkPages < ActiveRecord::Migration[6.0]
  def change
    create_table :link_pages do |t|
      t.references :user
      t.string :name
      t.string :slug
      t.timestamps
    end

    add_foreign_key :link_pages, :users
  end
end
