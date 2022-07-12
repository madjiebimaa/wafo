class User < ApplicationRecord
  has_secure_password
  belongs_to :role, polymorphic: true, optional: true

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :role_id, presence: false
  validates :role_type, presence: false

  def as_admin(admin_params)
    update(role: Admin.new(admin_params))
  end

  def as_customer(customer_params)
    update(role: Customer.new(customer_params))
  end

  def as_merchant(merchant_params)
    update(role: Merchant.new(merchant_params))
  end
end
