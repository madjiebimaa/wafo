class Customer < ApplicationRecord
  has_one :user, as: :role
  has_one :cart
end
