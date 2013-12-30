class RemoveSchemeAssociationJoinTables < ActiveRecord::Migration
  def up
    [:scheme_activity_relationships,
    :scheme_age_range_relationships,
    :scheme_commitment_length_relationships,
    :scheme_company_size_relationships,
    :scheme_location_relationships,
    :scheme_sector_relationships].each do |table|
      drop_table table
    end
  end

  def down
    create_table :scheme_sector_relationships do |t|
      t.references :scheme, index: true
      t.string :sector_id

      t.timestamps
    end

    add_index :scheme_sector_relationships,
              [:sector_id, :scheme_id],
              name: "index_scheme_sector_relationship",
              unique: true

    create_table :scheme_commitment_length_relationships do |t|
      t.references :scheme, index: true
      t.string :commitment_length_id

      t.timestamps
    end

    add_index :scheme_commitment_length_relationships,
              [:commitment_length_id, :scheme_id],
              name: "index_scheme_commitment_length_relationship",
              unique: true

    create_table :scheme_activity_relationships do |t|
      t.references :scheme, index: true
      t.string :activity_id

      t.timestamps
    end

    add_index :scheme_activity_relationships,
              [:activity_id, :scheme_id],
              name: "index_scheme_activity_relationship",
              unique: true

    create_table :scheme_company_size_relationships do |t|
      t.references :scheme, index: true
      t.string :company_size_id

      t.timestamps
    end

    add_index :scheme_company_size_relationships,
              [:company_size_id, :scheme_id],
              name: "index_scheme_company_size_relationship",
              unique: true

    create_table :scheme_age_range_relationships do |t|
      t.references :scheme, index: true
      t.string :age_range_id

      t.timestamps
    end

    add_index :scheme_age_range_relationships,
              [:age_range_id, :scheme_id],
              name: "index_scheme_age_range_relationship",
              unique: true

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
