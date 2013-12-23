class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.boolean :had_direct_interactions
      t.string :employees_number_range_id

      t.timestamps
    end
  end
end
