require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'すべての項目が適切に入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが1(__)だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idがnilでは保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが1(__)だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idがnilでは保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'shopping_fee_idが1(__)だと出品できない' do
        @item.shopping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee can't be blank")
      end

      it 'shopping_fee_idがnilでは保存できない' do
        @item.shopping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee can't be blank")
      end

      it 'prefecture_idが1(__)だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idがnilでは保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'delivery_time_idが1(__)だと出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it 'delivery_time_idがnilでは保存できない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10000000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角数字では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが文字列では出品できない' do
        @item.price = 'three thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが英数字混合では出品できない' do
        @item.price = '300abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐ついていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
