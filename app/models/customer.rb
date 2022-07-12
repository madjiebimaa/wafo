class Customer < ApplicationRecord
  has_one :user, as: :role
  has_one :cart

  def create_cart
    cart.create
  end

  def add_item_to_cart(item_id, quantity)
    # ! FIX: cart item status have to define by other conditions
    item = Item.find(item_id)
    cart.cart_items.create(item_id: item_id, quantity: quantity, status: "READY", total_price: item.price * quantity)
  end

  def update_cart_item_quantity(cart_item_id, quantity)
    CartItem.update(id: cart_item_id, quantity: quantity)
  end

  def destroy_cart_item(cart_item_id)
    CartItem.destroy(cart_item_id)
  end
end
