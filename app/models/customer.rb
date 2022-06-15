class Customer < ApplicationRecord
    has_one :user, as: :role
end
