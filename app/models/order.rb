class Order < ApplicationRecord
 
 has_many :order_details, dependent: :destroy
 belongs_to :customer
 
 validates :postal_code, presence: true
 validates :address, presence: true
 validates :name, presence: true
 validates :way_of_paying, presence: true
    
 enum way_of_paying: { credit_card: 0, transfer: 1}
 enum recieve_status: { payment_waiting: 0, payment_finish:1, production: 2, ready_to_delivery: 3,delivery_finish: 4}
 
  
 def with_tax_price
   (price*1.1).floor
 end  
   
 #小計
 def subtotal
     item.with_tax_price*amount
 end
 
 def sum_order_price
   subtotal+shipping_fee
 end 
 
 
end
