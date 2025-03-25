FactoryBot.define do
  factory :order_shipping_address do
    postal_code           { '111-2222' }
    prefecture_id         { 3 }
    city                  { '名古屋市' }
    street_address        { '駅前100' }
    building_name         { 'でっかいビル300' }
    phone_number          { '00011112222' }
  end
end
