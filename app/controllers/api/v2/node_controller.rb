class Api::V2::NodeController < ApiController

  def index
    render json: ActiveModelSerializers::SerializableResource.new(
      Node.all,
      each_serializer: Node::NodePreviewSerializer
    ).as_json
  end

  def show
    render json: Node::NodeDetailSerializer.new(Node.find(params[:id])).as_json
  end

end
