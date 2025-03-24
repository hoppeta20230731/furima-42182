class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end

  private

  def order_params
    { user_id: current_user.id, item_id: @item.id }
  end

  def shipping_address_params
    params.permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(order_id: @order.id)
  end
end
