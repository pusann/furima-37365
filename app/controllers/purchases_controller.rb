class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def   index
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
    if current_user == @item.user ||  @item.purchase.present?
      redirect_to root_path
    end
  end

  def  create
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new(purchase_params)
    if @shipping_address.valid?
      pay_item
     @shipping_address.save
      redirect_to  root_path
    else
       render :index
    end
  end
  private

  def purchase_params
    params.require(:shipping_address).permit(:post_code,:shipping_area_id,:municipality,:address,:building_name,:telephone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token]) 
  end
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end


