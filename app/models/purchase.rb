class Purchase < ApplicationRecord
  attr_accessor :token
  validates :token,presence: true
  belongs_to :item
  has_one :shipping_address
  belongs_to :user
end
