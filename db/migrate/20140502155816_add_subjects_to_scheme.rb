class AddSubjectsToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :subject_ids, :string, array: true, default: '{}'
    add_index :schemes, :subject_ids, using: 'gin'
  end
end
