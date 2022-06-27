class UserSerializer < ActiveModel::Serializer
  attributes :id, :role_id, :username, :email, :role, :created_at
  attribute :role_type, key: :role
end
