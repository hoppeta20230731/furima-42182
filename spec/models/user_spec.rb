require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要情報をすべて満たしていれば登録できる' do
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
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testpeta'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'peta1'
        @user.password_confirmation = 'peta1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英字と数字の両方を含めて設定してください'
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英字と数字の両方を含めて設定してください'
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.password_confirmation = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'xyz456'
        @user.password_confirmation = 'xyz4567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'hiroyuki'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name は全角（漢字・ひらがな・カタカナ）で入力してください'
      end
      it 'first_name_rubiが空では登録できない' do
        @user.first_name_rubi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name rubi は全角カタカナで入力してください'
      end
      it 'family_name_rubiが空では登録できない' do
        @user.family_name_rubi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name rubi は全角カタカナで入力してください'
      end
      it 'first_name_rubiが半角カナでは登録できない' do
        @user.first_name_rubi = 'ﾋﾛﾕｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name rubi は全角カタカナで入力してください'
      end
      it 'family_name_rubiが半角カナでは登録できない' do
        @user.family_name_rubi = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name rubi は全角カタカナで入力してください'
      end
      it 'first_name_rubiが全角かなでは登録できない' do
        @user.first_name_rubi = 'ひろゆき'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name rubi は全角カタカナで入力してください'
      end
      it 'family_name_rubiが全角かなでは登録できない' do
        @user.family_name_rubi = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name rubi は全角カタカナで入力してください'
      end
      it 'first_name_rubiが漢字では登録できない' do
        @user.first_name_rubi = '裕之'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name rubi は全角カタカナで入力してください'
      end
      it 'family_name_rubiが漢字では登録できない' do
        @user.family_name_rubi = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name rubi は全角カタカナで入力してください'
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
