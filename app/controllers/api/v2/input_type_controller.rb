class Api::V2::InputTypeController < ApiController

  def index
    render json: ActiveModelSerializers::SerializableResource.new(
      InputType.all,
      each_serializer: InputTypeSerializer
    ).as_json
  end

  def show
    render json: InputTypeSerializer.new(InputType.find_by_kind(params[:kind]))
  end

end
