class PurchasesController < ApplicationController
  def   index
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
  end

  def  create
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new(shipping_params)
    if @shipping_address.valid?
      @shipping_address.save
      redirect_to  root_path
    else
       render :index
    end
  end
  private

  def purchase_params
    params.require(:purchase).permit(:post_code,:prefectures_id,:municipality,:address,:building_name,:etelephone_number,:purchase,:image).merge(user_id: current_user.id,item_id: params[:item_id])  
  end
end