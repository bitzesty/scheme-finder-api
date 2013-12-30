class AddIndexesToSchemeAssociations < ActiveRecord::Migration
  def change
    add_index :schemes, :location_ids, using: 'gin'
    add_index :schemes, :sector_ids, using: 'gin'
    add_index :schemes, :activity_ids, using: 'gin'
    add_index :schemes, :age_range_ids, using: 'gin'
    add_index :schemes, :commitment_length_ids, using: 'gin'
    add_index :schemes, :company_size_ids, using: 'gin'
  end
end
