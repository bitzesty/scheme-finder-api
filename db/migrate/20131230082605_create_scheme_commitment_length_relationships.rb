class CreateSchemeCommitmentLengthRelationships < ActiveRecord::Migration
  def change
    create_table :scheme_commitment_length_relationships do |t|
      t.references :scheme, index: true
      t.string :commitment_length_id

      t.timestamps
    end

    add_index :scheme_commitment_length_relationships,
              [:commitment_length_id, :scheme_id],
              name: "index_scheme_commitment_length_relationship",
              unique: true
  end
end
