class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'は選択してください' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字で入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number,
                           order_id: order.id)
  end
end
