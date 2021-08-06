class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :project, foreign_key: true

      t.timestamps
    end
    add_index :lists, [:project_id, :created_at]
  end
end
