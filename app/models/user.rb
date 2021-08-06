class User < ApplicationRecord
  has_many :projects
  # has_many :items

  def all_project_ids
    self.projects.pluck(:id)
  end

  def all_visible_items
    Item.where(:project_id => all_project_ids)
  end
end
