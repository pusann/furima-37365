class  ShippingAddress
  include ActiveModel::Model 
  attr_accessor :post_code,:prefectures_id,:municipality,:address, :building_name,:telephone_number,:purchase

  validates :post_code, presence: true
  validates :prefectures_id, presence: true
  validates :municipality,  presence: true
  validates :address, presence: true
  validates :building_name, presence: true
  validates :telephone_number,presence: true
  validates :purchase,presence: true

  def save
    #shipping  = Shipping.create((price: price, user_id: user_id))
    #Address.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, telephone_number: telephone_number, building_name: building_name)

  end

end
