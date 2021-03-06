require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
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
    it '重複したemailは登録できない'  do
      @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@を含まない場合は登録できない'  do
      @user.email = 'hokokea.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'first_nameが空では登録できない'  do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameに半角文字が含まれていると登録できない'  do
      @user.first_name = 'おおｲち'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
      end
    it 'last_nameが空では登録できない'  do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameに半角文字が含まれていると登録できない'   do
      @user.last_name = 'あﾘ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'first_name_kanaが空では登録できない'  do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない'  do
      @user.first_name_kana = 'かo理9.'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it 'last_name_kanaが空では登録できない'  do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない'  do
        @user.last_name_kana = 'さ央3,'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
    it 'date_of_birthが空では登録できない'   do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end
    it 'passwordが空では登録できない'      do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordが6文字未満では登録できない'   do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it '英字のみのpasswordでは登録できない'  do
      @user.password = 'kaoiuyt'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '数字のみのpasswordでは登録できない'  do
      @user.password = '73548573'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '全角文字を含むpasswordでは登録できない'  do
      @user.password = 'こgtshつ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordとpassword_confirmationが不一致だと登録できない'  do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc1234'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
