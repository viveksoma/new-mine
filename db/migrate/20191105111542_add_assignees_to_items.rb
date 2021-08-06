class AddAssigneesToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :assignees, :string, default: ''
    add_index :items, :assignees
  end
end
