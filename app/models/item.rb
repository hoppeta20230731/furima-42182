class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'は選択してください' }
    validates :condition_id, numericality: { other_than: 1, message: 'は選択してください' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'は選択してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'は選択してください' }
    validates :shipping_day_id, numericality: { other_than: 1, message: 'は選択してください' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
