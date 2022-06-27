class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :address, :lat, :long, :image_url, :created_at
end
