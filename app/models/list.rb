class List < ApplicationRecord
  belongs_to :project
  has_many :items, dependent: :destroy
  validates :project_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  scope :get_list, -> (id) { where(id: id) }
end
