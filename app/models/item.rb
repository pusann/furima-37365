class Item < ApplicationRecord
   validates :product_name, presence: true
   validates :product_description, presence: true
   validates :category_id , presence: true,  numericality: { other_than: 1 , message: "can't be blank"}
   validates :product_condition_id, presence: true,  numericality: { other_than: 1 , message: "can't be blank"}
   validates :burden_of_shipping_charges_id, presence: true,  numericality: { other_than: 1 , message: "can't be blank"}
   validates :shipping_area_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}  
   validates :days_to_ship_id, presence: true,  numericality: { other_than: 1 , message: "can't be blank"}   
   validates :selling_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
   validates :image,presence: true
  
   belongs_to :user
   #has_many :comments
   has_one :purchase
   has_one_attached :image

   extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :burden_of_shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to_ship
end
 