class  ShippingAddress
  include ActiveModel::Model 
  attr_accessor :post_code,:shipping_area_id,:municipality,:address, :building_name,:telephone_number,:item_id,:user_id,:token

  with_options presence: true do
  validates :post_code,        presence: true,format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :shipping_area_id, presence: true,numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality,     presence: true
  validates :address,          presence: true
  validates :telephone_number, presence: true,format: {with: /\A\d{10}$|^\d{11}\z/ }
  end
  validates :user_id,          presence: true
  validates :item_id,          presence: true
  validates :token,            presence: true
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality,address: address, telephone_number: telephone_number, building_name: building_name,purchase_id:purchase.id)
  end

end
