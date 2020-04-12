class Api::V2::RequestController < ApiController

  def create
    Request.create(request: params[:datum])
    render json: {}, status: 200
  end

end
