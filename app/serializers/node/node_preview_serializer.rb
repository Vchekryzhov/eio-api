class Node::NodePreviewSerializer < NodeBaseSerializer
  attributes :id, :title, :image, :preview_description
  def image
    object.image.img_proxy_url
  end
end
