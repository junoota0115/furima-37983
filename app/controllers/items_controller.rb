class ItemsController < ApplicationController  

  def index
    @items = Item.order("created_at DESC")
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

private
def item_params
  params.require(:item).permit(:item_name, :content, :category_id,:item_status_id,:postage_id,:prefecture_id,:send_day_id,:price,:user)
end
end
