require 'rails_helper'

RSpec.describe Item, type: :model  do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録'   do
    context '商品出品登録ができる場合'    do
      it  '全ての項目が入力されていれば出品できる'    do
        expect(@item).to be_valid
      end
    end
  
    context '商品出品登録ができない場合'   do
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
      it 'selling_priceが空では登録できない'   do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is invalid"
      end
      it 'selling_priceが299以下だと登録できない' do
        @item.selling_price = '298'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is invalid"
      end
      it 'category_idに「---」が選択されている場合は出品できない'   do
        @item.category_id = 1
        @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'product_condition_idに「---」が選択されている場合は出品できない'   do
        @item.product_condition_id = 1
        @item.valid?
          expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end

      it  'burden_of_shipping_charges_idに「---」が選択されている場合は出品できない'   do
        @item.burden_of_shipping_charges_id =  1
        @item.valid?
          expect(@item.errors.full_messages).to include "Burden of shipping charges can't be blank"
      end
      it 'shipping_area_idに「---」が選択されている場合は出品できない'   do
        @item.shipping_area_id =  1
        @item.valid?
          expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it  'days_to_ship_idに「---」が選択されている場合は出品できない'    do
        @item.days_to_ship_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it   'selling_priceに半角数字以外が含まれている場合は出品できない'    do
        @item.selling_price = '８７９'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is invalid"
        end
      it  'selling_priceが9_999_999円を超えると出品できない'        do
        @item.selling_price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is invalid"
      end
      it   'userが紐付いていなければ出品できない'      do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end   
end