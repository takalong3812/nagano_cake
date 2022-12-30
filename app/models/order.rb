class Order < ApplicationRecord
 
 has_many :order_details, dependent: :destroy
 belongs_to :customer
 
 validates :postal_code, presence: true
 validates :address, presence: true
 validates :name, presence: true
 validates :way_of_paying, presence: true
    
 enum payment_method: { credit_card: 0, transfer: 1}
 enum order_status: { payment_waiting: 0, payment_finish:1, production: 2, ready_to_delivery: 3,delivery_finish: 4}
 
 def add_tax
   (item.price * 1.10).round
 end  
    
end
