class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :scheme, index: true
      t.integer :score
      t.text :description
      t.boolean :approved, default: false

      t.timestamps
    end

    add_index :feedbacks, :approved
  end
end
