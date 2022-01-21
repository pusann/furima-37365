require 'rails_helper'

RSpec.describe Item, type: :model  do
  before do
    @item = FactoryBot.build(:item)
   end
   describe '商品出品登録'   do
     it 'imageを1枚つけることが必須であること'  do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include  "Selling price is invalid. Include hyphen(-)"
     end
    it 'product_nameが空では登録できない'    do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
    end
    it 'product_descriptionが空では登録できない'    do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product description can't be blank"
    end
    it  'category_idの情報が空では登録できない'    do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'product_condition_idの情報が空では登録できない'   do
      @item.product_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product condition can't be blank"
    end
    it 'burden_of_shipping_charges_idの情報が空では登録できない'   do
      @item.burden_of_shipping_charges_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Burden of shipping charges can't be blank"
    end
    it 'shipping_area_idの情報が空では登録できない'   do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area can't be blank"
    end
    it 'days_to_ship_idの情報が空では登録できない'   do
      @item.days_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship can't be blank"
    end
    it 'selling_priceが空では登録できない'   do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Selling price can't be blank"
      end
      it 'selling_priceが299以下だと登録できないこと' do
        @item.selling_price = '298'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is invalid. Include hyphen(-)"
        end
   end
end