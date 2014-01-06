class SchemeDescriptionAsText < ActiveRecord::Migration
  def change
    remove_column :schemes, :description, :string
    add_column :schemes, :description, :text
  end
end
