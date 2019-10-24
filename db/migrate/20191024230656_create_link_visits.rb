class CreateLinkVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :link_visits do |t|
      t.references :link
      t.timestamps
    end

    add_foreign_key :link_visits, :links
  end
end
