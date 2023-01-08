class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
   
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)

    
     if Order.recieve_status[@order.order_status]==1
      @order.order_details.each do |order_detail|
       order_detail.update(order_status:1)
      end
     end    
   redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end