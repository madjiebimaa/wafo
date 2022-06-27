class ItemSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :name, :description, :price, :stock, :image_url, :served_at, :expired_at
end
