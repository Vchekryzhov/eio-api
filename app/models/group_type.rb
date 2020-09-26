class GroupType < ApplicationRecord
  validates :kind, presence: true
  validates :title, presence: true
end
