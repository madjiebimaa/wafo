class Merchant < ApplicationRecord
  has_many :items

  def find_by_name(name)
    find_by(name: name).take
  end

  def create_item(item)
    items.create(item)
  end

  def update_item_stock(item_id, stock)
    item = items.find_by_id(item_id)
    item.stock = stock
    item.save!
  end

  def find_items
    items.all
  end

  def available?
    !merchant.items.empty?
  end

  def available_merchants
    merchants = all
    available_merchants = []
    merchants.each { |merchant| available_merchants.push(merchant) if merchant.available? }
  end
end
