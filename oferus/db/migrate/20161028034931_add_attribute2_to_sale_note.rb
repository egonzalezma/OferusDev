class AddAttribute2ToSaleNote < ActiveRecord::Migration
  def change
  	add_column :sale_notes, :order_number, :string
    add_column :sale_notes, :order_type, :string
    add_column :sale_notes, :domain, :string
    add_column :sale_notes, :order_custom_client, :string
    add_column :sale_notes, :order_bill_client, :string
    add_column :sale_notes, :order_ship_client, :string
    add_column :sale_notes, :order_create_date, :date
    add_column :sale_notes, :order_create_time, :time 
    add_column :sale_notes, :order_create_user, :string 
    add_column :sale_notes, :order_generate_date, :date 
    add_column :sale_notes, :order_generate_time, :time 
    add_column :sale_notes, :order_generate_user, :string
    add_column :sale_notes, :order_approves_date, :date 
    add_column :sale_notes, :order_approves_time, :time 
    add_column :sale_notes, :order_approves_user, :string 
    add_column :sale_notes, :order_exports_date, :date 
    add_column :sale_notes, :order_exports_time, :time 
    add_column :sale_notes, :order_exports_user, :string 
    add_column :sale_notes, :order_origin, :string
    add_column :sale_notes, :order_remove, :string
    add_column :sale_notes, :order_code, :string
    add_column :sale_notes, :order_site, :string
    add_column :sale_notes, :order_seller_code, :string
    add_column :sale_notes, :order_transport_code, :string
    add_column :sale_notes, :order_credit_type, :string
    add_column :sale_notes, :order_discount_type, :string
    add_column :sale_notes, :order_state, :integer
  end
end

