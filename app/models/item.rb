class Item < ApplicationRecord
   validates :product_name, presence: true
   validates :product_description, presence: true
   validates :category_id , presence: true
   validates :product_condition_id, presence: true
   validates :burden_of_shipping_charges_id, presence: true
   validates :shipping_area_id, presence: true
   validates :days_to_ship_id, presence: true
   validates :selling_price, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  
   belongs_to :user
   has_many :comments
   has_one :purchase
   has_one_attached :image

include ActiveHash::Associations
  has_many :Category
end
 
