class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role, :created_at
  attribute :role_type, key: :role
end
