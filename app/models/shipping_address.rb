class ShippingAddress < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めてください' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'は選択してください' }
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字で入力してください' }
end
