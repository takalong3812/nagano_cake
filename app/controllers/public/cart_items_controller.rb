class Public::CartItemsController < ApplicationController
    
  def index
   @cart_items= CartItem.all
   @total= 0
  end 
  
  def create
    @cart_item= CartItem.new
    @cart_item.customer_id= current_customer.id
    if cart_item= current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
       cart_item= amount += params[:cart_item][:amount].to_i
       cart_item.save
      redirect_to public_cart_items_path
    else
      @cart_item.save
      redirect_to public_cart_items_path
    end  
  end 
  
  def update
    @cart_item= current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    # 遷移元のURLを取得
    redirect_to request.referer
  end 
  
  def destroy
    @cart_items= current_customer.cart_items.find(params[:id])
    @cart_items.destroy
    # 遷移元のURLを取得
    redirect_to request.referer
  end
  
  def destroy_all
    @cart_items= current_customer.cart_items
    @cart_items.destroy_all
    # 遷移元のURLを取得
    redirect_to request.referer
  end
    


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end      

end
