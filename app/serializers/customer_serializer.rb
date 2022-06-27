class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :phone_number, :created_at
end
