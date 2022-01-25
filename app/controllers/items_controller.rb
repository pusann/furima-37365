class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  #before_action :move_to_index, only: [:show]

  def index
    @items = Item.all.order(created_at: :desc)
  end
  def  new
    @item = Item.new
  end
  def  create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path
    else
      render :new
     end
  end
  def  edit  
    @item = Item.find(params[:id])
      unless current_user.id ==  @item.user_id
        redirect_to action: :index
    end
  end

   def   update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to item_path
    else
      render :edit
    end
  end

  def  show
    @item = Item.find(params[:id])
    end
  private

  def item_params
    params.require(:item).permit(:product_name,:product_description,:category_id,:product_condition_id,:burden_of_shipping_charges_id,:shipping_area_id,:days_to_ship_id,:selling_price,:image).merge(user_id: current_user.id)  
  end
  
end

