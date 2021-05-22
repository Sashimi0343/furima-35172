require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録ができる' do
      it 'OK：全ての項目が適切に記入出来ていれば登録ができる。' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない' do
      context 'nickname・email・passwordについて' do
        it 'NG：nicknameが空' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'NG：emailが空' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'NG：emailが既に使用されている' do
          @user.save
          @user2 = FactoryBot.build(:user)
          @user2.email = @user.email
          @user2.valid?
          expect(@user2.errors.full_messages).to include('Email has already been taken')
        end

        it 'NG：emailに＠がない' do
          @user.email = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'NG：passwordが空' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'NG：passwordが5文字以下' do
          @user.password = 'test1'
          @user.password_confirmation = 'test1'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'NG：passwordが半角英語のみでは登録できない' do
          @user.password = 'testtest'
          @user.password_confirmation = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'NG：passwordが数字のみの登録はできない' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'NG：passwordが全角英数混合は登録できない' do
          @user.password = 'qwrt１２'
          @user.password_confirmation = 'qwrt１２'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
        end

        it 'NG：password_confirmationが不一致' do
          @user.password_confirmation = 'test10000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end

      context 'name4種・birthdayについて' do
        it 'NG：last_nameが空' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'NG：last_nameがひらがな・カタカナ・漢字ではない' do
          @user.last_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
        end

        it 'NG：first_nameが空' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'NG：first_nameがひらがな・カタカナ・漢字ではない' do
          @user.first_name = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
        end

        it 'NG：last_name_kanaが空' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'NG：last_name_kanaがカタカナではない' do
          @user.last_name_kana = 'TEST'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
        end

        it 'NG：first_name_kanaが空' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'NG：first_name_kanaがカタカナではない' do
          @user.first_name_kana = 'TEST'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
        end

        it 'NG：birthdayが空' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
