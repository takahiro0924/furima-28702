class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_sell_item, only: [:edit, :show, :update]

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
  end

  def destroy
    sell_item = SellItem.find(params[:id])
    if sell_item.destroy
      redirect_to action: :index
    else
      render 'show'
    end
  end

  def edit
  end

  def update
    if @sell_item.update(sell_item_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  private

  def sell_item_params
    params.require(:sell_item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_sell_item
    @sell_item = SellItem.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
