class OrderDetail < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    
    enum production_status:{ not_yet:0, waiting:1, working:2, complete:3}
    
    
     def subtotal
     item.with_tax_price*amount
     end
     
end     
