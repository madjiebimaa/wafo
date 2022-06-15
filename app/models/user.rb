class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  def find_by_id(id)
    find(id).take
  end

  def find_by_username(username)
    find_by(username: username).take
  end

  def find_by_email(email)
    find_by(email: email).take
  end
end
