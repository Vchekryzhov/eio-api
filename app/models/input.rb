class Input < ApplicationRecord
  belongs_to :input_type
  belongs_to :group
  def input_type=(v)
    super(InputType.find_by_kind(v))
  end
  def group=(v)
    super(Group.find_by_kind(v))
  end
end
