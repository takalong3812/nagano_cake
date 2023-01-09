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
   
 
    
end
