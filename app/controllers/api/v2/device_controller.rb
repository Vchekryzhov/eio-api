class Api::V2::DeviceController < ApiController
  def show
    render json: DeviceSerializer.new(Device.find(params[:id]))
  end

end
