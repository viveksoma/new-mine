class Project < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }

  scope :get_project, -> (id) { where(id: id) }
end
