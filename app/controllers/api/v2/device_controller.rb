class Api::V2::DeviceController < ApiController
  def show
    render json: DeviceSerializerSerializer.new(Device.find(params[:id]))
  end

end
