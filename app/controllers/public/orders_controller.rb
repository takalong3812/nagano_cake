class Public::OrdersController < ApplicationController
    
   def new
     @order = Order.new
     @credit_card = Order.payment_methods.key(0)
     @transfer = Order.payment_methods.key(1)
     @credit_card_ja = Order.payment_methods_i18n[:credit_card]
     @transfer_ja = Order.payment_methods_i18n[:transfer]
     @addresses= Address.where(customer_id:current_customer)
   end 
   
   def confirm
     @cart_items= current_customer.cart_items
     @order= Order.new(order_params)
   end
   
   
   private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :recieve_status, :way_of_paying,:postal_code, :address, :name)
  end
  
end
