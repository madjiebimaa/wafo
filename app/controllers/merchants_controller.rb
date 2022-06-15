class MerchantsController < ApplicationController
  before_action :find_merchant, except: %i[index create]

  def index
    @merchants = Merchant.all
    success_response(@merchants, :ok)
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      success_response(@merchant, :created)
    else
      error_message = @merchant.errors.full_messages
      fail_response(error_message, :unprocessable_entity)
    end
  end

  def show_items
    items = @merchant.find_items
    success_response(items, :ok)
  end

  def create_item
    puts "Merchant ID: #{@merchant.id}"
    @merchant.create_item(item_params)
    success_message = "success create item for merchant with id #{@merchant.id}"
    success_response({ message: success_message }, :created)
  end

  def update_item_stock
    @merchant.update_item_stock(params[:item_id], params[:stock])
    success_response({}, :no_content)
  end

  private

  def find_merchant
    @merchant = Merchant.find_by_id(params[:merchant_id])
  rescue ActiveRecord::RecordNotFound
    error_message = 'User not found'
    fail_response(error_message, :not_found)
  end

  def merchant_params
    params.permit(:name, :address, :phone_number, :image_url)
  end

  def item_params
    params.permit(:name, :description, :price, :stock, :image_url, :served_at, :expired_at)
  end
end
