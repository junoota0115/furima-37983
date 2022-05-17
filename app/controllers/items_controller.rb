class ItemsController < ApplicationController  
  before_action :move_to_index, except: :index

  def index
    @items = Item.order("created_at DESC")
  end

def new
  @item = Item.new
end

def create
  @item  = Item.new(item_params)
  @item.user_id = current_user.id
if @item.save
  redirect_to root_path
else
  render :new
end
end

private
def item_params
  params.require(:item).permit(:image,:item_name, :content, :category_id,:item_status_id,:postage_id,:prefecture_id,:send_day_id,:price,:user).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end
end
