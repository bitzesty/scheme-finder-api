class RemoveCommitmentLengthFromScheme < ActiveRecord::Migration
  def up
    remove_column :schemes, :commitment_length_ids
  end

  def down
    add_column :schemes, :commitment_length_ids, :string, array: true, default: '{}'
  end
end
