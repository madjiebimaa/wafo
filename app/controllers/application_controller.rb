class ApplicationController < ActionController::API
  def success_response(data, status, message)
    response = { success: true, data: data, message: message }
    render json: response, status: status
  end

  def fail_response(status, message)
    response = { success: false, data: nil, message: message }
    render json: response, status: status
  end

  def not_found
    puts ENV["DB_USERNAME"]
    puts ENV["DB_PASSWORD"]
    puts ENV["DB_HOST"]
    puts ENV["DB_PORT"]
    fail_response(:not_found, 'endpoint not found')
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      fail_response(e.message, :unauthorized)
    rescue JWT::DecodeError => e
      fail_response(e.message, :unauthorized)
    end
  end
end
