class Node::NodeDetailSerializer < NodeBaseSerializer
  attributes :id, :title, :devices
  def devices
    object.devices.map do |device|
      DeviceSerializer.new(device)
    end
  end
end
