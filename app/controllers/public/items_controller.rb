class Public::ItemsController < ApplicationController
    
   def index
    @items= Item.all
    @genres= Genre.all
   end 
   
   def show
     @item= Item.find(params[:id])
     @genres= Genre.all
     @items= Item.all
     @cart_item= CartItem.new
   end
   
   private
   
   def item_params
    params.require(:item).permit(:image)
   end
    
end
