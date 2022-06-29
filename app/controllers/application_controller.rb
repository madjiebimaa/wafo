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
    fail_response(:not_found, 'endpoint tidak ditemukan')
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

  def is_admin
    fail_response(:forbidden, 'user tidak memiliki role sebagai admin') if @current_user.role_type == 'admin'
  end

  def is_customer
    fail_response(:forbidden, 'user tidak memiliki role sebagai customer') if @current_user.role_type == 'customer'
  end

  def is_merchant
    fail_response(:forbidden, 'user tidak memiliki role sebagai merchant') if @current_user.role_type == "merchant"
  end
end
