class Admin::ItemsController < ApplicationController
    
  def new
    @item = Item.new
    @genres = Genre.all
  end 
  
  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to admin_item_path(@item.id)
    else
     flash.now{:alert] = "もう一度入力し直してください"
     render "index"
    end
  end    
  
  
      
end
