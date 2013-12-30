class CreateSchemeSectorRelationships < ActiveRecord::Migration
  def change
    create_table :scheme_sector_relationships do |t|
      t.references :scheme, index: true
      t.string :sector_id

      t.timestamps
    end

    add_index :scheme_sector_relationships,
              [:sector_id, :scheme_id],
              name: "index_scheme_sector_relationship",
              unique: true
  end
end
