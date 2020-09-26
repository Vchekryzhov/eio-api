class Group::GroupPreviewSerializer < GroupBaseSerializer
  attributes :id, :parent_id, :group_type_id, :device_id
end
