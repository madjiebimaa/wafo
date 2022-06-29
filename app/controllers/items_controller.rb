class ItemsController < ApplicationController
  before_action :is_customer

  def index
    @items = Item.all

    if params[:name]
      @items = @items.where(name: params[:name])
    end

    serialized_items = ActiveModelSerializers::SerializableResource.new(@items,
                                                                        { each_serializer: ItemSerializer }).as_json
    success_response(serialized_items, :ok, nil)
  end
end
