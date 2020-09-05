class SellItem < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :status
  has_one_attached :image

  validates :name, :image, :explanation, :area_id, :category_id, :day_id, :delivery_fee_id, :status_id, :price, :user_id, presence: true

  validates :area_id, :category_id, :day_id, :delivery_fee_id, :status_id, numericality: { other_than: 0 } 

  with_options presence: true, format: { with: /3[0-9][0-9]|9[0-9][0-9][0-9][0-9][0-9][0-9]/, message: '価格の範囲を半角英数、¥300~¥9,999,999の間で指定てください' } do
    validates :price
  end
end
