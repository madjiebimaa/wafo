class UsersController < ApplicationController
  before_action :authorize_request
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    success_response(@users, :ok)
  end

  # GET /users/{username}
  def show
    success_response(@user, :ok)
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      error_message = @user.errors.full_messages
      fail_response(error_message, :unprocessable_entity)
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username(params[:_username])
  rescue ActiveRecord::RecordNotFound
    error_message = 'User not found'
    fail_response(error_message, :not_found)
  end

  def user_params
    params.permit(:username, :email, :password)
  end
end
