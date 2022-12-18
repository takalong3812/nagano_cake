class Admin::CustomersController < ApplicationController
    
   def index    
     @customers = Customer.all
   end
   
   def show
     @customer = Customer.find(params[:id])
   end 
   
   
   
    private
   
   def customer_params
     params_require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
   end 
   
   
end
