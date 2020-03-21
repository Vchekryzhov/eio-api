class Input < ApplicationRecord
  belongs_to :input_type, primary_key: :kind, foreign_key: :input_type
  def input_type=(v)
    super(InputType.find_by_kind(v))
  end
  belongs_to :group
end
