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
     frash.now[:alert] = "もう一度入力し直してください"
     render "index"
    end
 
  end  
  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introdustion, :price, :genre_id, :is_active, :image)
  end
  
  
      
end
