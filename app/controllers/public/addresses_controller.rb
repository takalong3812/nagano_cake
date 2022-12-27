class Public::AddressesController < ApplicationController
  def index
   @address= Address.new
   @addresses= Address.all      
  end    
    
  def create
    @address= Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
     flash[:notice] = "配送先の登録が完了しました。"
     redirect_to public_addresses_path
    else
      flash[:alert] = "もう一度入力して下さい。"
     @addresses= current_customer.addresses.all
     render :index
    end      
    
  end
  
  def edit
    @address= Address.find(params[:id])
  end
  
  def update
     @address= Address.find(params[:id])
     @address.customer_id= current_customer.id
     if @address.update(address_params)
       flash[:notice]= "配送先情報を編集しました。"
       redirect_to public_addresses_path
     else
        flash[:alert] = "もう一度入力してください。"
        render :edit
     end   
  end
  
  def destroy
     @address= Address.find(params[:id])
     @address.destroy
     flash[:notice]= "配送先を削除しました。"
     redirect_to public_addresses_path
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end  

end