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
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@を含まない場合は登録できない'  do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'first_nameが空では登録できない'  do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameに半角文字が含まれていると登録できない'  do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
      end
    it 'last_nameが空では登録できない'  do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameに半角文字が含まれていると登録できない'   do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_name_kanaが空では登録できない'  do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない'  do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'last_name_kanaが空では登録できない'  do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない'  do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
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
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '英字のみのpasswordでは登録できない'  do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '数字のみのpasswordでは登録できない'  do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '全角文字を含むpasswordでは登録できない'  do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordとpassword（確認用）が不一致だと登録できない'  do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
  end
end
