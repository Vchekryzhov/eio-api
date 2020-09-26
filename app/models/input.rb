class Input < ApplicationRecord
  belongs_to :input_type
  belongs_to :group
  validates :input_type, :group, presence: true
  validates :input_type, :group, presence: { message: "can't create imputs with attributes #{attributes}" }
  def input_type=(v)
    super(InputType.find_by_kind(v))
  end
  def group=(v)
    super(Group.find_by_kind(v))
  end
end
