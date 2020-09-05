class SellItem < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :status
  has_one_attached :image

  validates :name, :explanation, :area_id, :category_id, :day_id, :delivery_fee_id, :status_id, :price, :user_id, presence: true

  validates :area_id, :category_id, :day_id, :delivery_fee_id, :status_id, numericality: { other_than: 0 } 
end
