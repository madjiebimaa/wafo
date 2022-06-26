class UsersController < ApplicationController
  before_action :authorize_request

  def index
    @users = User.all
    success_response(@users, :ok, nil)
  end

  def show
    @user = User.find_by(username: params[:username])
    success_response(@user, :ok, nil)
  end

  def add_role
    # ! FIX: user hanya dapat memiliki satu role
    role = params[:role]
    case role
    when 'Admin'
      @current_user.as_admin(admin_params)
    when 'Customer'
      @current_user.as_customer(customer_params)
    when 'Merchant'
      @current_user.as_merchant(merchant_params)
    else
      error_message = 'user role tidak diketahui'
      fail_response(:unprocessable_entity, error_message)
      return
    end

    success_message = "berhasil menambahkan role user: #{@current_user.username} sebagai #{role.downcase}"
    success_response(nil, :created, success_message)
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def admin_params
    params.permit(:firstname, :lastname, :phone_number)
  end

  def customer_params
    params.permit(:firstname, :lastname, :phone_number)
  end

  def merchant_params
    params.permit(:name, :address, :phone_number, :image_url)
  end
end
