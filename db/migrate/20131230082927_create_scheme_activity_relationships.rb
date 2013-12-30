class CreateSchemeActivityRelationships < ActiveRecord::Migration
  def change
    create_table :scheme_activity_relationships do |t|
      t.references :scheme, index: true
      t.string :activity_id

      t.timestamps
    end

    add_index :scheme_activity_relationships,
              [:activity_id, :scheme_id],
              name: "index_scheme_activity_relationship",
              unique: true
  end
end
