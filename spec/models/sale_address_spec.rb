require 'rails_helper'

RSpec.describe SaleAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @sale_address = FactoryBot.build(:sale_address, user_id: user.id, item_id: item.id)
    end

    context '商品購入できるとき' do
      it 'すべての項目を入力したら、商品が購入できる' do
        expect(@sale_address).to be_valid
      end
      it 'buildingが空でも、商品が購入できる' do
        @sale_address.building = ''
        expect(@sale_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空の場合、購入できない' do
        @sale_address.post_code = ''
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include("Post code can't be blank",
                                                              'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が全角の場合、購入できない' do
        @sale_address.post_code = '１２３ー４５６７'
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号がハイフンを含まない場合、購入できない' do
        @sale_address.post_code = '1234567'
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空の場合、購入できない' do
        @sale_address.prefecture_id = ''
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空の場合、購入できない' do
        @sale_address.municipalities = ''
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空の場合、購入できない' do
        @sale_address.street_address = ''
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空の場合、購入できない' do
        @sale_address.telephone_number = ''
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が9桁以下の場合、購入できない' do
        @sale_address.telephone_number = '12345'
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end
      it '電話番号が12桁以上の場合、購入できない' do
        @sale_address.telephone_number = '123451234512345'
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end
      it '電話番号が全角の場合、購入できない' do
        @sale_address.telephone_number = '１２３４５１２３４５'
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include('Telephone number 10桁以上11桁以内の半角数値で入力してください')
      end
      it 'トークンが空の場合、購入できない' do
        @sale_address.token = nil
        @sale_address.valid?
        expect(@sale_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
