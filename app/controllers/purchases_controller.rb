class PurchasesController < ApplicationController
  def   index
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
  end

  def  create
    binding.pry
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
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
    params.require(:purchase).permit(:post_code,:prefectures_id,:municipality,:address,:building_name,:etelephone_number,:purchase,:image).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token]) 
  end
  def pay_item
    Payjp.api_key = ""
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end