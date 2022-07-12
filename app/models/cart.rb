class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_many :cart_items
end
