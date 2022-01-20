require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:item)
   end
   describe 'product_imageを1枚つけることが必須である'  do
     @user.product_image = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product_image can't be blank"
    end
    it 'product_nameが空では登録できない'    do
      @user.product_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product_name can't be blank"
    end
    it '商品の説明が空では登録できない'    do
      @user.product = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product can't be blank"
    end
    it  'カテゴリーの情報が空では登録できない'    do
      @user.product = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product can't be blank"
    end
    it '商品の状態の情報が空では登録できない'   do
      @user.product = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product can't be blank"
    end
    it '配送料の負担の情報が空では登録できない'   do
      @user.product = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product can't be blank"
    end
    it '発送元の地域の情報が空では登録できない'   do
      @user.product = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product can't be blank"
    end
    it '発送までの日数の情報が空では登録できない'   do
      @user.product = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "product can't be blank"
    end
