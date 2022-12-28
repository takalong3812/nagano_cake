class CartItem < ApplicationRecord

 belongs_to :customer
 belongs_to :item
 
 
 #小計
 def subtotal
   item.with_tax_price * amount
 end
 
  # 消費税を加えた商品価格
 def add_tax_subtotal
   (item.price * 1.1).round * amount
 end
    
end
