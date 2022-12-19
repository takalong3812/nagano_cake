class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_fee
      t.integer :billing_amount
      t.integer :way_of_paying
      t.integer :recieve_status

      t.timestamps
    end
  end
end
