class ApplicationController < ActionController::API

  def success_response(data, status)
    response = { status: 'success', data: data, error: nil }
    render json: response, status: status
  end

  def fail_response(message, status)
    response = { status: 'fail', data: nil, error: { message: message } }
    render json: response, status: status
  end

  def not_found
    fail_response('endpoint not found', :not_found)
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(token)
      @current_user = User.find_by_id(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      fail_response(e.message, :unauthorized)
    rescue JWT::DecodeError => e
      fail_response(e.message, :unauthorized)
    end
  end
end
