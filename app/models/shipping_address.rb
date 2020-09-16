class ShippingAddress < ApplicationRecord
  belongs_to :buy_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
end
