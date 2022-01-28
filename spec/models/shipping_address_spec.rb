require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before     do
    @shipping_address = FactoryBot.build(:shipping_address)
    
  end

describe '商品購入'   do
  context '内容に問題がない場合'   do
    it 'すべての内容が正しく入力されていれば保存できること'  do
      expect(@shipping_address).to be_valid
     end
     it "priceとtokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end
  context '内容に問題がある場合'  do
    it 'post_codeが空ではないこと'    do    
      @shipping_address.post_code = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include "Post code can't be blank"
     end
    it  'post_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと'   do
      @shipping_address.post_code = '123456'
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include "Post code is invalid"
    end
    it 'prefectures_idに「---」が選択されている場合は購入できない'  do
      @shipping_address.prefectures_id = 1
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include "Prefectures can't be blank"
    end 
    it   'municipalityが空ではないこと'    do
      @shipping_address.municipality = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include "Municipality can't be blank"
    end
    it  'addressが空ではないこと'   do
      @shipping_address.address = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include  "Address can't be blank"
    end
    it  'telephone_numberが空ではないこと'    do
      @shipping_address.telephone_number = ''
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include "Telephone number can't be blank"
    end
  
     it  'telephone_numberは、10桁以上11桁以内の半角数値のみ'   do
      @shipping_address.telephone_number = '0901５234567７'
      @shipping_address.valid?
       expect(@shipping_address.errors.full_messages).to include "Telephone number is invalid"
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
