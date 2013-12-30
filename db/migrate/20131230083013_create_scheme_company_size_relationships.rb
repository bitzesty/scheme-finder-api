class CreateSchemeCompanySizeRelationships < ActiveRecord::Migration
  def change
    create_table :scheme_company_size_relationships do |t|
      t.references :scheme, index: true
      t.string :company_size_id

      t.timestamps
    end

    add_index :scheme_company_size_relationships,
              [:company_size_id, :scheme_id],
              name: "index_scheme_company_size_relationship",
              unique: true
  end
end
