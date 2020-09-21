class Device < ApplicationRecord
  belongs_to :device_type
  belongs_to :node
end
