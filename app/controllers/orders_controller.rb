class OrdersController < ApplicationController
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    binding.pry
    if @purchase.valid?
    @purchase.save
    redirect_to root_path
    else
    render action: :index
    end
  end


private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :genre_prefecture_id, :city, :house_number, :building_name, :phone_number,:token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
