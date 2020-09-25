class BuyItemsInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :sell_item_id, :token

  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :prefecture_id, :city, :address, :token, presence: true
  with_options presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } do
    validates :postal_code
  end
  with_options presence: true, format: { with: /\A\d{11}\z/ } do
    validates :phone_number
  end

  def save
    # buy_itemを保存
    buy_item = BuyItem.create(user_id: user_id, sell_item_id: sell_item_id)
    # shipping_addressを保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buy_item_id: buy_item.id)
  end
end
