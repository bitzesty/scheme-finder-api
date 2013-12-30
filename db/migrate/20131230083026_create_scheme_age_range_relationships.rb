class CreateSchemeAgeRangeRelationships < ActiveRecord::Migration
  def change
    create_table :scheme_age_range_relationships do |t|
      t.references :scheme, index: true
      t.string :age_range_id

      t.timestamps
    end

    add_index :scheme_age_range_relationships,
              [:age_range_id, :scheme_id],
              name: "index_scheme_age_range_relationship",
              unique: true
  end
end
