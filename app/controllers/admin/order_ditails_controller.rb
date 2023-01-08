class Admin::OrderDitailsController < ApplicationController
    
  before_action :authenticate_admin!
  
  
  def index
    @order= Order.find_by(params[:id])
    @order_details= @order.order_details
  end 
  
  def update
    @order_detail= OrderDetail.find(params[:order_id])
    @order= @order_detail.order
    @order_detail.update(order_detail_params)
    
    if @order_detail.production_status == "製作中"
      @order.update(status:2)
      
    elsif @order_detail.production_status == "製作完了"
        
       @order_details = @order.order_details
       production_status_complete = @order_details.where(production_status: "製作完了")
       
       if production_status_complete.count == @order_details.count
         @order.update(status:3)
       end
       
       redirect_to request.referer
    end
    
  end
  
  private
  
  def order_detail_params
     params.require(:order_detail).permit(:production_status) 
  end
    
end
