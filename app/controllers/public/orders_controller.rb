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
    @order = Order.new(order_params)

    if params[:order][:address_id] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif  params[:order][:address_id] == "1"
      @addresses = Address.find(params[:order][:address_id])
      @order.postal_code = @addresses.postal_code
      @order.address = @addresses.address
      @order.name = @addresses.name

    else params[:order][:address_id] == '2'
    end    
   end
   
   def create
     order= Order.new(order_params)
     order.customer_id= current_customer.id
     if order.save
      current_customer.cart_items.each do |f|
         OrderItem.create(order_id: order.id, item_id: f.item_id, order_amount: f.amount, price_after_tax: f.item.add_tax_price)
     end
       current_customer.cart_items.destroy_all
       redirect_to public_orders_thanks_path
     else
       redirect_to action: new
     end   
   
   end
   
   def thanks
   end
   
   def index
    @orders= Order.all
   end
   
   def show
    if params[:id] == "confirm"
    redirect_to new_public_order_path
    else
      @oreder= Order.find(params[:id])
    end  
   end
   
   
   
   
   private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :billing_amount, :order_status, :postal_code, :address, :name, :payment_method)
  end
  
end
