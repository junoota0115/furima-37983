class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out


  def index
    @order_shipping_add = OrderShippingAdd.new
    if current_user == @item.user
      redirect_to root_path
      end
  end


  def create
    @order_shipping_add = OrderShippingAdd.new(order_shipping_add_params)
    if @order_shipping_add.valid?
      pay_item
      @order_shipping_add.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def order_shipping_add_params
    params.require(:order_shipping_add).permit(:postal_code, :prefecture_id, :city, :address, :building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
  Payjp::Charge.create(
    amount: @item.price,  
    card: order_shipping_add_params[:token],    
    currency: 'jpy'                 
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

def sold_out
if @item.order.present?
  redirect_to root_path
end
end
end