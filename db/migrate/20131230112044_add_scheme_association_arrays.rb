class AddSchemeAssociationArrays < ActiveRecord::Migration
  def up
    add_column :schemes, :location_ids, :string, array: true, default: '{}'
    add_column :schemes, :sector_ids, :string, array: true, default: '{}'
    add_column :schemes, :activity_ids, :string, array: true, default: '{}'
    add_column :schemes, :age_range_ids, :string, array: true, default: '{}'
    add_column :schemes, :commitment_length_ids, :string, array: true, default: '{}'
    add_column :schemes, :company_size_ids, :string, array: true, default: '{}'
  end

  def down
    remove_column :schemes, :location_ids
    remove_column :schemes, :sector_ids
    remove_column :schemes, :activity_ids
    remove_column :schemes, :age_range_ids
    remove_column :schemes, :commitment_length_ids
    remove_column :schemes, :company_size_ids
  end
end
