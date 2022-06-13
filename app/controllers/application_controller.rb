class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def success_response(data, status)
    response = { status: 'success', data: data, error: nil }
    render json: response, status: status
  end

  def fail_response(message, status)
    response = { status: 'fail', data: nil, error: { message: message } }
    render json: response, status: status
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
