class ItemsController < ApplicationController  
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :sold_out, only: [:edit, :update,:destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

def new
  @item = Item.new
end

def create
  @item  = Item.new(item_params)
if @item.save
  redirect_to root_path
else
  render :new
end
end

def show
end

def edit
end
  


def update
  if @item.update(item_params)
    redirect_to item_path(item_params)
  else
    render :edit
  end
  
end

def destroy
  if @item.destroy
    redirect_to root_path
  else
    render :show
  end 
end


private
def item_params
  params.require(:item).permit(:image,:item_name, :content, :category_id,:item_status_id,:postage_id,:prefecture_id,:send_day_id,:price,:user).merge(user_id: current_user.id)
end
def set_item
  @item = Item.find(params[:id])
end

def move_to_index
  if @item.user_id == current_user.id
  else
    redirect_to root_path
  end
end

def sold_out
  if @item.order.present?
    redirect_to root_path
  end
  end
end