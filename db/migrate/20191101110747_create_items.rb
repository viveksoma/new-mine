class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :content
      t.references :list, foreign_key: true

      t.timestamps
    end
    add_index :items, [:list_id, :created_at]
  end
end
