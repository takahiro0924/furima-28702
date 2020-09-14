class BuyItemsController < ApplicationController
  def index
    @sell_item = SellItem.find(params[:item_id])
    @buy_item = BuyItem.new
  end

end
