class AuthenticationController < ApplicationController
  before_action :authorize_request, except: %i[login register]

  def register
    @user = User.new(register_params)
    if @user.save
      success_response(@user, :created, nil)
      # UserSerializer.new(@user).as_json https://github.com/rails-api/active_model_serializers/tree/0-10-stable
    else
      error_message = @user.errors.full_messages
      fail_response(:unprocessable_entity, error_message)
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      time_formatted = time.strftime("%m-%d-%Y %H:%M")
      success_response({ token: token, exp: time_formatted, username: @user.username }, :ok, nil)
    else
      error_message = 'User unauthorized'
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
