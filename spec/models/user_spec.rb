require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nicknameを入力してください"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Emailを入力してください"
    end
    it 'first_nameが空では登録できない'  do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First nameを入力してください"
    end
    it 'last_nameが空では登録できない'  do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last nameを入力してください"
    end
    it 'first_name_kanaが空では登録できない'  do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"First name kanaを入力してください"
    end
    it 'last_name_kanaが空では登録できない'  do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kanaを入力してください"
      end
    it 'date_of_birthが空では登録できない'   do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birthを入力してください"
    end
    it 'passwordが空では登録できない'      do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Passwordを入力してください"
    end
  end
end
