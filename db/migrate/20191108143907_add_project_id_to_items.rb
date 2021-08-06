class AddProjectIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :project_id, :integer
  end
end
