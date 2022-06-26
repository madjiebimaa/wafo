class MerchantsController < ApplicationController
  before_action :authorize_request
  before_action :find_merchant, except: %i[index create]

  def index
    @merchants = Merchant.all
    if params[:ready]
      @merchants = Merchant.ready_merchants
    elsif params[:name]
      @merchants = Merchant.where(name: params[:name])
    end

    success_response(@merchants, :ok, nil)
  end

  def show_items
    items = @merchant.find_items
    if items.empty?
      fail_message = "merchant dengan id: #{@merchant.id} tidak memiliki item yang sedang dipasarkan"
      fail_response(:not_found, fail_message)
      return
    end

    success_response(items, :ok, nil)
  end

  def create_item
    @merchant.create_item(item_params)
    success_message = "merchant dengan id #{@merchant.id} berhasil menambahkan item"
    success_response(nil, :created, success_message)
  end

  def update_item_stock
    puts params
    puts "MERCHANT ID: #{@merchant.id}"
    puts "ITEM ID: #{params[:item_id]}"
    @merchant.update_item_stock(params[:item_id], params[:stock])
    success_message = "merchant dengan id #{@merchant.id} berhasil mengupdate stock item"
    success_response(nil, :ok, success_message)
  end

  private

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  rescue ActiveRecord::RecordNotFound
    error_message = 'User not found'
    fail_response(:not_found, error_message)
  end

  def item_params
    params.permit(:name, :description, :price, :stock, :image_url, :served_at, :expired_at)
  end
end
