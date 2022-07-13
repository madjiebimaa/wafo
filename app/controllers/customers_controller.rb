class CustomersController < ApplicationController
  before_action :authorize_request
  before_action :admin?, only: %i[index show]

  def index
    @customers = Customer.all

    serialized_customers = ActiveModelSerializers::SerializableResource.new(@admins,
                                                                            { each_serializer: CustomerSerializer }).as_json
    success_response(serialized_customers, :ok, nil)
  end

  def show
    @customer = Customer.find(params[:id])

    if @customer.nil?
      fail_message = "customer dengan id #{params[:id]} tidak dapat ditemukan"
      fail_response(:not_found, fail_message)
      return
    end

    serialized_customer = CustomerSerializer.new(@customer).as_json
    success_response(serialized_customer, :ok, nil)
  end
end
