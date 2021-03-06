class Node::NodePreviewSerializer < NodeBaseSerializer
  attributes :id, :title, :image, :preview_description, :image_color
  def image
    object.image.img_proxy_url({width: 150, height: 150})
  end
end
