class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render edit_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :selling_price, :genre_id, :genre_status_id, :genre_shipping_cost_id, :genre_prefecture_id, :genre_shipping_day_id).merge(user_id: current_user.id)
  end
end
