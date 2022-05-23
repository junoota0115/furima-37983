class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end


  def create

    @item = Item.find(params[:item_id])
    @order_shipping_add = OrderShippingAdd.new(order_params)
    if @order_shipping_add.valid?
      @order_shipping_add.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end