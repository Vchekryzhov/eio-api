class Api::V2::GroupTypeController < ApiController

  def index
    render json: ActiveModelSerializers::SerializableResource.new(
      GroupType.all,
      each_serializer: GroupTypeSerializer
    ).as_json
  end

  def show
    render json: GroupTypeSerializer.new(GroupType.find_by(params[:kind]))
  end

end
