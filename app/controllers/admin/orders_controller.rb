class Admin::OrdersController < ApplicationController
    
    
  def index
     @orders = Order.all
  end
  
  def show
     @order = Order.find(params[:id])
  end
     
  
   private
   
   def order_params
      params.require(:order).permit(:status)
   end  
      
      



end
