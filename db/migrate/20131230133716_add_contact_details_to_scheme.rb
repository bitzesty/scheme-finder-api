class AddContactDetailsToScheme < ActiveRecord::Migration
  def change
    add_column :schemes, :contact_name, :string
    add_column :schemes, :contact_email, :string
    add_column :schemes, :contact_phone, :string
    add_column :schemes, :name, :string
    add_column :schemes, :website, :string
    add_column :schemes, :description, :string

    add_index :schemes, :name, unique: true
  end
end
