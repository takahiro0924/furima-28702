class BuyItemsController < ApplicationController
  before_action :set_sell_item, only: [:index, :create]

  def index
    unless current_user.id == @sell_item.user_id
      @buy_item = BuyItemsInfo.new
    else
      redirect_to root_path
    end
  end

  def create
    @buy_item = BuyItemsInfo.new(buy_item_params)
    if @buy_item.valid?
      pay_item
      @buy_item.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_item_params
    params.require(:buy_items_info).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, sell_item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @sell_item = SellItem.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @sell_item.price, # 商品の値段
      card: buy_item_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_sell_item
    @sell_item = SellItem.find(params[:item_id])
  end

end
