class AddEstimateToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :estimate, :integer, default: 0
  end
end
