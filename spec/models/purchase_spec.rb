require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before     do
    @Purchase = FactoryBot.build(:Purchase)
  end

describe '商品購入'   do
  context '内容に問題がない場合'   do
    it 'すべての内容が正しく入力されていれば保存できること'  do
      expect(@Purchase).to be_valid
     end
    end
  context '内容に問題がある場合'  do
    it 'post_codeが空ではないこと'    do
      @Purchase.post_code = ''
      @Purchase.valid?
      expect(@Purchase.errors.full_messages).to include "Post code can't be blank"
     end
    it  'post_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと'   do
      @Purchase.post_code = '123-4567'
      @Purchase.valid?
      expect(@Purchase.errors.full_messages).to include "Post code can't be blank"
    end
    it 'prefectures_idが空ではないこと'  do
      @Purchase.prefectures_id = ''
      @Purchase.valid?
      expect(@Purchase.errors.full_messages).to include "Prefectures id code can't be blank"
    end 
    it   'municipalityが空ではないこと'    do
      @Purchase.municipality = ''
      @Purchase.valid?
      expect(@Purchase.errors.full_messages).to include "Municipality  can't be blank"
    end
    it  'addressが空ではないこと'   do
      @Purchase.address = ''
      @Purchase.valid?
      expect(@Purchase.errors.full_messages).to include "Address  can't be blank"
    end
    it  'telephone_numberが空ではないこと'    do
      @Purchase.telephone_number = ''
      @Purchase.valid?
      expect(@Purchase.errors.full_messages).to include "Telephone_number code can't be blank"
    end
  
     it  'telephone_numberは、10桁以上11桁以内の半角数値のみ'   do
       @Purchase.telephone_number = '09012345678'
       @Purchase.valid?
       expect(@Purchase.errors.full_messages).to include "Telephone_number code can't be blank"
      end
    end
   end
end