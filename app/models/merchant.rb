class Merchant < ApplicationRecord
  has_many :items

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
    !items.empty?
  end

  def self.find_by_name(name)
    find_by(name: name)
  end

  def self.available_merchants
    available_merchants = []
    all.each { |merchant| available_merchants.push(merchant) if merchant.available? }
    available_merchants
  end
end
