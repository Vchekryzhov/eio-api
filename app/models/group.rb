class Group < ApplicationRecord
  belongs_to :group_type, primary_key: :kind, foreign_key: :group_type
  def group_type=(v)
    super(GroupType.find_by_kind(v))
  end
  has_many :inputs
  belongs_to :parent_group, foreign_key: :parent_id, class_name: 'Group', optional: true
  has_many :child_groups, primary_key: :id, foreign_key: :parent_id, class_name: 'Group'
end
