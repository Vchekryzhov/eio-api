class ApiController <  ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render(json: { error: exception.message }, status: :not_found)
  end

  rescue_from ArgumentError do |exception|
    render(json: { error: exception.message }, status: :argument_error)
  end

  rescue_from ActionController::BadRequest do |exception|
    render(json: { error: exception.message }, status: :bad_request)
  end

  rescue_from ActionController::BadRequest do |exception|
    render(json: { error: exception.message }, status: :bad_request)
  end
  
  rescue_from ActiveRecord::RecordInvalid do |exception|
    render(json: { error: exception.message }, status: :bad_request)
  end
end
