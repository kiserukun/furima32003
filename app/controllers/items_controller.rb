class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
