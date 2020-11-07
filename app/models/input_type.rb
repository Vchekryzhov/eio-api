class InputType < ApplicationRecord
  validates :kind, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
