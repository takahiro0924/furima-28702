class BuyItem < ApplicationRecord
  belongs_to :sell_item
  belongs_to :user
  has_one :shipping_address
end
