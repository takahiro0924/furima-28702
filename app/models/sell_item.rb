class SellItem < ApplicationRecord
  belongs_to :user
  has_one :buy_item
  has_many :comment

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :status
  has_one_attached :image

  validates :name, :image, :explanation, :area_id, :category_id, :day_id, :delivery_fee_id, :status_id, :price, presence: true

  validates :area_id, :category_id, :day_id, :delivery_fee_id, :status_id, numericality: { other_than: 0, message: "を選択してください" }

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  
end
