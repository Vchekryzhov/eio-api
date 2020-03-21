class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :title
  def title
    object.name
  end
end
