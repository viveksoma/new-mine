class Item < ApplicationRecord
  # belongs_to :user
  belongs_to :list
  belongs_to :project
  validates :list_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :estimate, allow_nil: true, numericality: true, inclusion: { in: 0..1000 }

  scope :get_item, -> (id) { where(id: id) }
  scope :mytask, -> (user) {where("assignees = ? AND is_completed = ?",  user.id, false)}
  scope :completed_task, -> (user) {where("assignees = ? AND is_completed = ?",  user.id, true)}

  def self.is_deliverable_type?(type)
    ['task', 'subtask'].include?(type)
  end
end
