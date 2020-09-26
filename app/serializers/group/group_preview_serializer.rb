class Group::GroupPreviewSerializer < GroupBaseSerializer
  attributes :id, :parent_id, :group_type_id, :devices
  def devices
    object.devices.map do |device|
      DeviceSerializer.new(device)
    end
  end
end
