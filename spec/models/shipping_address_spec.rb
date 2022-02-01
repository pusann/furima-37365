require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before     do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @shipping_address = FactoryBot.build(:shipping_address,user_id: @user,item_id: @item)
    sleep 0.5
  end

describe '商品購入'   do
  context '内容に問題がない場合'   do
    it 'すべての内容が正しく入力されていれば保存できること'  do
      expect(@shipping_address).to be_valid
     end
     it "priceとtokenがあれば保存ができること" do
      expect(@shipping_address).to be_valid
    end
    it ' building_nameが空でも購入できる'   do
      @shipping_address.building_name = ''
      expect(@shipping_address).to be_valid
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
    it 'shipping_area_idに「---」が選択されている場合は購入できない'  do
      @shipping_address.shipping_area_id = 1
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include "Shipping area can't be blank"
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
      it  'telephone_numberは、12桁以上は購入できない'   do
        @shipping_address.telephone_number = '090746598326'
        @shipping_address.valid?
         expect(@shipping_address.errors.full_messages).to include "Telephone number is invalid"
        end
        it  'telephone_numberは、9桁以下は購入できない'   do
          @shipping_address.telephone_number = '09046735'
          @shipping_address.valid?
           expect(@shipping_address.errors.full_messages).to include "Telephone number is invalid"
          end
      it "tokenが空では登録できないこと" do
        @shipping_address.token = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include  "Token can't be blank"
      end
      it 'userが紐づいていなければ購入できない'   do
        @shipping_address.user_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "User can't be blank"
        end
      it 'itemが紐づいていなければ購入できない'   do
        @shipping_address.item_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Item can't be blank"
        end
    end
  end
end

