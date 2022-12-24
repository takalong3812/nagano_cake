class Public::CustomersController < ApplicationController
    
    def show
        @customer= current_customer
    end
    
     private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted)
  end
    
end
