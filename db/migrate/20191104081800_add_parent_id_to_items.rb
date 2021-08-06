class AddParentIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :parent_id, :string
  end
end
