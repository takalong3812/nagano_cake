class Item < ApplicationRecord

 has_many :order_details, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 
 
 belongs_to :genre
 has_one_attached :image
 
  
  validates :name, presence: true
  validates :price, presence: true
end
