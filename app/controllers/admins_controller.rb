class AdminsController < ApplicationController
  before_action :authorize_request
  before_action :admin?, only: %i[index show]

  def index
    @admins = Admin.all

    serialized_admins = ActiveModelSerializers::SerializableResource.new(@admins,
                                                                         { each_serializer: AdminSerializer }).as_json
    success_response(serialized_admins, :ok, nil)
  end

  def show
    @admin = Admin.find(params[:id])

    if @admin.nil?
      fail_message = "admin dengan id #{params[:id]} tidak dapat ditemukan"
      fail_response(:not_found, fail_message)
      return
    end

    serialized_admin = AdminSerializer.new(@admin).as_json
    success_response(serialized_admin, :ok, nil)
  end
end
