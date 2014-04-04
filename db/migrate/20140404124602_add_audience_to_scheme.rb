class AddAudienceToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :audience_ids, :string, array: true, default: '{}'
    add_index :schemes, :audience_ids, using: 'gin'
  end
end
