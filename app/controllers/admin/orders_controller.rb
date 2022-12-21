class Admin::OrdersController < ApplicationController
    
    
  def index
     @orders = Order.all
  end
  
  def show
     @order = Order.find(params[:id])
  end
  
  def confirm
     @order = Order.new(order_params)
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
  end     
     
   private
   
   def order_params
      params.require(:order).permit(:status)
   end  
      
      



end
