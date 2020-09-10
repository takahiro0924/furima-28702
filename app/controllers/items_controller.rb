class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @sell_item = SellItem.includes(:user)
  end

  def new
    @sell_item = SellItem.new
  end

  def create
    @sell_item = SellItem.new(sell_item_params)
    if @sell_item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show
    @sell_item = SellItem.find(params[:id])
  end


  def destroy
    sell_item = SellItem.find(params[:id])
    if sell_item.destroy
      redirect_to action: :index
    else
      render'show'
    end
  end
  
  private

  def sell_item_params
    params.require(:sell_item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
