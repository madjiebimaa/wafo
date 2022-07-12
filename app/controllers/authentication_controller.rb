class AuthenticationController < ApplicationController
  before_action :authorize_request, except: %i[login register]

  def register
    @user = User.new(register_params)
    if @user.save
      serialized_user = UserSerializer.new(@user).as_json
      success_response(serialized_user, :created, nil)
    else
      fail_message = @user.errors.full_messages
      fail_response(:unprocessable_entity, fail_message)
    end
  end

  def login
    email = params[:email]
    @user = User.find_by(email: params[:email])

    if @user.nil?
      fail_message = "user dengan email #{email} tidak dapat ditemukan"
      fail_response(:not_found, fail_message)
      return
    end

    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      time_formatted = time.strftime("%m-%d-%Y %H:%M")
      success_response({ token: token, exp: time_formatted, username: @user.username }, :ok, nil)
    else
      error_message = 'username atau password salah'
      fail_response(:unauthorized, error_message)
    end
  end

  private

  def register_params
    default_username = params[:email].split('@', 2)[0]
    params.permit(:username, :email, :password).with_defaults(username: default_username)
  end

  def login_params
    params.permit(:email, :password)
  end
end
