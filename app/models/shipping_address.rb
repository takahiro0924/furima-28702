class ShippingAddress < ApplicationRecord
  belongs_to :buy_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area

  validates :area_id, numericality: { other_than: 0 }

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, presence: true

  with_options presence: true, format: { with: /^[0-9]{3}-[0-9]{4}$/, message: '-を含め半角数字で入力してください' } do
    validates :postal_code
end

