class UsersController < ApplicationController
  before_action :authorize_request
  before_action :admin?, only: %i[index show]

  def index
    @users = User.all
    serialized_users = ActiveModelSerializers::SerializableResource.new(@users,
                                                                        { each_serializer: UserSerializer }).as_json

    success_response(serialized_users, :ok, nil)
  end

  def show
    username = params[:username]
    @user = User.find_by(username: username)

    if @user.nil?
      fail_message = "user dengan username #{username} tidak dapat ditemukan"
      fail_response(:not_found, fail_message)
      return
    end

    serialized_user = UserSerializer.new(@user).as_json
    success_response(serialized_user, :ok, nil)
  end

  def add_role
    # ! FIX: user hanya dapat memiliki satu role
    role = params[:role]

    case role
    when 'Admin'
      @current_user.as_admin(admin_params)
    when 'Customer'
      @current_user.as_customer(customer_params)
      @current_user.role.create_cart
    when 'Merchant'
      @current_user.as_merchant(merchant_params)
    else
      fail_message = 'user role tidak diketahui'
      fail_response(:unprocessable_entity, fail_message)
      return
    end

    success_message = "berhasil menambahkan role #{role.downcase} kepada user dengan username #{@current_user.username}"
    success_response(nil, :created, success_message)
  end

  private

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
