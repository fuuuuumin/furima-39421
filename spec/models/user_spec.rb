require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailがすでに登録されている場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない場合' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下の場合は登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが129文字以上の場合は登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'パスワードが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが半角数字のみでは登録できない' do
        @user.password = '222222'
        @user.password_confirmation = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが全角文字を含むパスワードでは登録できない' do
        @user.password = 'aaaaaaあ'
        @user.password_confirmation = 'aaaaaaあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワード（確認）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認）が一致しない場合は登録できない' do
        @user.password = '123aaa'
        @user.password_confirmation = '123bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前lastname（全角）が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前lastname（全角）が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力して下さい。')
      end
      it 'お名前firstname（全角）が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前firstname（全角）が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力して下さい。')
      end
      it 'お名前カナlastname（全角）が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナlastname（全角）が全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana はカタカナで入力して下さい。')
      end
      it 'お名前カナfirstname（全角）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナfirstname（全角）が全角（カタカナ）以外では登録できない' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana はカタカナで入力して下さい。')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
