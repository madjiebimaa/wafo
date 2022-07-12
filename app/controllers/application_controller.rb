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
    fail_response(:not_found, 'endpoint tidak dapat ditemukan')
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      fail_response(:unauthorized, e.message)
    rescue JWT::DecodeError => e
      fail_response(:unauthorized, e.message)
    end
  end

  def admin?
    return fail_response(:forbidden, 'user tidak memiliki role sebagai admin') unless @current_user.role_type == 'Admin'
  end

  def customer?
    return fail_response(:forbidden,
                         'user tidak memiliki role sebagai customer') unless @current_user.role_type == 'Customer'
  end

  def merchant?
    return fail_response(:forbidden,
                         'user tidak memiliki role sebagai merchant') unless @current_user.role_type == 'Merchant'
  end
end
