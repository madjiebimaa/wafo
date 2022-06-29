class MerchantsController < ApplicationController
  before_action :authorize_request
  before_action :is_merchant, except: %i[index]
  before_action :is_customer, only: %i[index]
  before_action :find_merchant, except: %i[index create]

  def index
    @merchants = Merchant.all

    if params[:ready]
      @merchants = @merchants.ready_merchants
    end

    if params[:name]
      @merchants = @merchants.where(name: params[:name])
    end

    serialized_merchants = ActiveModelSerializers::SerializableResource.new(@merchants,
                                                                            { each_serializer: MerchantSerializer }).as_json
    success_response(serialized_merchants, :ok, nil)
  end

  def show_items
    items = @merchant.find_items
    if items.empty?
      fail_message = "merchant dengan id: #{@merchant.id} tidak memiliki item yang sedang dipasarkan"
      fail_response(:not_found, fail_message)
      return
    end

    serialized_items = ActiveModelSerializers::SerializableResource.new(items,
                                                                        { each_serializer: ItemSerializer }).as_json
    success_response(serialized_items, :ok, nil)
  end

  def create_item
    @merchant.create_item(item_params)
    success_message = "merchant dengan id #{@merchant.id} berhasil menambahkan item"
    success_response(nil, :created, success_message)
  end

  def update_item_stock
    @merchant.update_item_stock(params[:item_id], params[:stock])
    success_message = "merchant dengan id #{@merchant.id} berhasil mengupdate stock item"
    success_response(nil, :ok, success_message)
  end

  private

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  rescue ActiveRecord::RecordNotFound
    error_message = "merchant dengan id #{@merchant.id} tidak ditemukan"
    fail_response(:not_found, error_message)
  end

  def item_params
    params.permit(:name, :description, :price, :stock, :image_url, :served_at, :expired_at)
  end
end
