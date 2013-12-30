class RemoveEmployeesNumberRangeIdFromSchemes < ActiveRecord::Migration
  def change
    remove_column :schemes, :employees_number_range_id, :integer
  end
end
