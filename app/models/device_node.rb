class DeviceNode < ApplicationRecord
  belongs_to :node
  belongs_to :device
end
