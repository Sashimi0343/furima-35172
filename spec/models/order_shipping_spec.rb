require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入処理について' do
    before do
      item = FactoryBot.create(:item) # 裏でitemを出品したuser1が存在する
      user2 = FactoryBot.create(:user) # user2が商品を購入する人
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user2.id, item_id: item.id)
    end

    context '商品の購入が出来る' do
      it 'OK：全ての値が正しく入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
        sleep 0.1
      end

      it 'OK：buildingは空でも良い' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
        sleep 0.1
      end
    end

    context '商品の購入が出来ない-postal_code・prefecture_id・municipalityについて' do
      it 'NG：postal_codeが空' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
        sleep 0.1
      end

      it 'NG：postal_codeに「-」が無い' do
        @order_shipping.postal_code = '1234556'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Exampe 123-4567')
        sleep 0.1
      end

      it 'NG：postal_codeの桁数が多い' do
        @order_shipping.postal_code = '123-45678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Exampe 123-4567')
        sleep 0.1
      end

      it 'NG：postal_codeの桁数が足りない' do
        @order_shipping.postal_code = '123-456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Exampe 123-4567')
        sleep 0.1
      end

      it 'NG：postal_codeに全角数字が入っている' do
        @order_shipping.postal_code = '１２３-４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Exampe 123-4567')
        sleep 0.1
      end

      it 'NG：prefecture_idが選択されていない' do
        @order_shipping.prefecture_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture Please choose an option.')
        sleep 0.1
      end

      it 'NG：municipalityが空' do
        @order_shipping.municipality = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipality can't be blank")
        sleep 0.1
      end
    end

    context '商品の購入が出来ない-address・phone_number・token・アソシエーションについて' do
      it 'NG：addressが空' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
        sleep 0.1
      end

      it 'NG：phone_numberが空' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
        sleep 0.1
      end

      it 'NG：phone_numberの桁数が多い' do
        @order_shipping.phone_number = '111111111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number Please enter up to 11 letters')
        sleep 0.1
      end

      it 'NG：phone_numberが全角数字' do
        @order_shipping.phone_number = '０８０５４８６４１２４'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number Please enter half-width numbers')
        sleep 0.1
      end

      it 'NG：tokenが空' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
        sleep 0.1
      end

      it 'NG：userが存在しない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
        sleep 0.1
      end

      it 'NG：itemが存在しない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
        sleep 0.1
      end
    end
  end
end
