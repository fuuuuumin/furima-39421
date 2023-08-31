require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'すべての項目を入力したら、商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '画像が空の場合、出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空の場合、出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空の場合、出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーが空の場合、出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーが「--」の場合、出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空の場合、出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '商品の状態が「--」の場合、出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料が空の場合、出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it '配送料が「--」の場合、出品できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it '発送元の地域が空の場合、出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送元の地域が「--」の場合、出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が空の場合、出品できない' do
        @item.shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment can't be blank"
      end
      it '発送までの日数が「--」の場合、出品できない' do
        @item.shipment_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipment can't be blank"
      end
      it '価格が空の場合、出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が300円より小さい場合、出品できない' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price ¥300~¥9,999,999で指定してください'
      end
      it '価格が9,999,999円より大きい場合、出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price ¥300~¥9,999,999で指定してください'
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
