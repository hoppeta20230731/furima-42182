require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全て正しい内容なら有効である' do
        expect(@order_shipping_address).to be_valid
      end
      it 'building_nameが空でも有効である' do
        @order_shipping_address.building_name = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_shipping_address.postal_code = '1112222'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code はハイフン(-)を含めてください')
      end
      it 'prefecture_idが空では購入できない' do
        @order_shipping_address.prefecture_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Prefecture は選択してください')
      end
      it 'cityが空では購入できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @order_shipping_address.street_address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると購入できない' do
        @order_shipping_address.phone_number = '000-1111-2222'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number は10桁または11桁の数字で入力してください')
      end
      it 'phone_numberが9桁では購入できない' do
        @order_shipping_address.phone_number = '000111122'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number は10桁または11桁の数字で入力してください')
      end
      it 'phone_numberが12桁では購入できない' do
        @order_shipping_address.phone_number = '000111122222'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number は10桁または11桁の数字で入力してください')
      end
      it 'user_idが空では購入できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
