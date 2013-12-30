class CreateSchemeLocationRelationships < ActiveRecord::Migration
  def change
    create_table :scheme_location_relationships do |t|
      t.references :scheme, index: true
      t.string :location_id

      t.timestamps
    end

    add_index :scheme_location_relationships,
              [:location_id, :scheme_id],
              name: "index_scheme_location_relationship",
              unique: true
  end
end
