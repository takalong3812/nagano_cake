class Admin::ItemsController < ApplicationController
    
  def new
    @item = Item.new
    @genres = Genre.all
  end 
  
  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to admin_item_path(@item.id), notice: "新商品登録完了！"
    else
     frash.now[:alert] = "もう一度入力し直してください"
     render "index"
    end
 
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
    
  end
  
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])

  end
  
  

  
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introdustion, :price, :genre_id, :is_active, :image)
  end
  
  
      
end
