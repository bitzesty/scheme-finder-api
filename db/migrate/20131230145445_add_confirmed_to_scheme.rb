class AddConfirmedToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :confirmed, :boolean, default: false
  end
end
