class Api::V2::GroupController < ApiController

  def index
    render json: ActiveModelSerializers::SerializableResource.new(
      Group.all,
      each_serializer: Group::GroupPreviewSerializer
    ).as_json
  end

end
