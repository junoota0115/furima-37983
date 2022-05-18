class ItemsController < ApplicationController  
  before_action :authenticate_user!, except: [:index,:show]

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
  @item  = Item.find(params[:id])
end

def edit
  @item  = Item.find(params[:id])
  if @item.user_id == current_user.id && @item.present?
  else
    redirect_to root_path
  end
end
  


def update
  @item = Item.find(params[:id])
  @item.update(item_params)
  if @item.valid?
    redirect_to item_path(item_params)
  else
    render :edit
  end
  
end


private
def item_params
  params.require(:item).permit(:image,:item_name, :content, :category_id,:item_status_id,:postage_id,:prefecture_id,:send_day_id,:price,:user).merge(user_id: current_user.id)
end
end