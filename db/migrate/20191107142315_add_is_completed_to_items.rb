class AddIsCompletedToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :is_completed, :boolean, default: false
  end
end
