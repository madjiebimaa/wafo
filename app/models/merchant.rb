class Merchant < ApplicationRecord
  has_one :user, as: :role
  has_many :items

  def create_item(item)
    items.create(item)
  end

  def update_item_stock(item_id, stock)
    item = items.find(item_id)
    item.stock = stock
    item.save!
  end

  def find_items
    items.all
  end

  def ready?
    !items.empty?
  end

  def self.ready_merchants
    ready_merchants = []
    all.each { |merchant| ready_merchants.push(merchant) if merchant.ready? }
    ready_merchants
  end
end
