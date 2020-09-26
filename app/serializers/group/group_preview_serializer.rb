class Group::GroupPreviewSerializer < GroupBaseSerializer
  attributes :id, :title, :parent_id, :group_type_id, :device_id
end
