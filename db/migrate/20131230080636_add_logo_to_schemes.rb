class AddLogoToSchemes < ActiveRecord::Migration
  def change
    add_column :schemes, :logo, :string
  end
end
