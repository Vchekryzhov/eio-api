class Device < ApplicationRecord
  belongs_to :device_type
  has_many :groups
  has_many :device_nodes
  has_many :nodes, through: :device_nodes 
end
