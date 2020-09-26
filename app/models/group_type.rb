class GroupType < ApplicationRecord
  validates :kind, presence: true
  validates :title, presence: true
  has_many :groups
end
