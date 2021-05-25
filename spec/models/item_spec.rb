require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品について' do
    context 'OK：商品の出品○' do
      it 'OK：全ての項目が適切に記入出来ていれば登録ができる。' do
        expect(@item).to be_valid
      end
    end

    context 'NG：商品の出品×[title・description・image・price・user]' do
      it 'NG：titleが空' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'NG：descriptionが空' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'NG：imageが空' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'NG：priceが空' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'NG：priceが全角数字' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Please enter half-width numbers')
      end

      it 'NG：priceが299以下' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Please enter 300 〜 9,999,999')
      end

      it 'NG：priceが10000000以上' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Please enter 300 〜 9,999,999')
      end

      it 'NG：userが存在しない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end

    context 'NG：商品の出品×[ActiveHash5種]' do
      it 'NG：category_idが選択されていない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Please choose an option.')
      end

      it 'NG：status_idが選択されていない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Please choose an option.')
      end

      it 'NG：delivery_charge_idが選択されていない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge Please choose an option.')
      end

      it 'NG：prefecture_idが選択されていない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Please choose an option.')
      end

      it 'NG：days_to_ship_idが選択されていない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Please choose an option.')
      end
    end
  end
end
