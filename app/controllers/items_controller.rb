class ItemsController < ApplicationController
  before_action :authorize_request
  before_action :customer?, only: %i[index]

  def index
    @items = Item.all

    name = params[:name]
    @items = @items.where(name: name) if name

    if @items.empty?
      fail_message = 'tidak dapat menemukan item'
      fail_response(:not_found, fail_message)
      return
    end

    serialized_items = ActiveModelSerializers::SerializableResource.new(@items,
                                                                        { each_serializer: ItemSerializer }).as_json
    success_response(serialized_items, :ok, nil)
  end
end
