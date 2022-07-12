class CustomersController < ApplicationController
  before_action :is_customer
  before_action :current_customer

  def add_item_to_cart
    @current_customer.add_item_to_cart(params[:item_id], params[:quantity])
    success_response(nil, :created, nil)
  end

  def update_cart_item_quantity
    @cart_item = @current_customer.cart.find(params[:cart_item_id])
    @cart_item.quantity = params[:quantity]
    success_response(@cart_item, :ok, nil)
  end

  def destroy_cart_item
    @cart_item = @current_customer.cart.find(params[:cart_item_id])
    
    return fail_response(:not_found, 'cart item tidak ditemukan') if @cart_item == nil

    @cart_item.destroy
    success_response(nil, :ok, "cart item dengan id #{@cart_item.id} berhasil dihapus")
  end

  private

  def current_customer
    @current_customer = @current_user.role
  end
end
