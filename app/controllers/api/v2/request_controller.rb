class Api::V2::RequestController < ApiController
before_action :accept_all_params

  def create
    byebug
    Request.create(request: params[:request])
    render json: {}, status: 200
  end

  private

  def accept_all_params
    params.permit!
  end
end
