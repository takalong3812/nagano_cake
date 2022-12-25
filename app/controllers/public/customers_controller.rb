class Public::CustomersController < ApplicationController
    
    def show
        @customer= current_customer
    end
    
    def edit
        @customer = current_customer
    end
    
     def update
       @customer = current_customer
       if @customer.update(customer_params)
       flash[:success] = "登録情報を編集しました。"
       redirect_to public_customer_path(current_customer)
       else
       flash[:alert] = "もう一度入力してください。"
       render :customer_edit
       end
      
     end
     
     def unsubsveibe
     end
     
     def withdraw
        @customer = current_customer
        @customer.update(is_deleted: false)
    
     end
     
     private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted)
  end
    
end
