class AddAttributeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :client_unique_number, :string
    add_column :clients, :client_rut, :string
    add_column :clients, :client_name1, :string
    add_column :clients, :client_name2, :string
    add_column :clients, :client_address1, :string
    add_column :clients, :client_address2, :string
    add_column :clients, :client_city, :string
    add_column :clients, :client_phone, :string
    add_column :clients, :client_fax, :string
    add_column :clients, :client_cell_phone, :string
    add_column :clients, :client_web_site, :string
    add_column :clients, :domain, :string
    add_column :clients, :client_type1, :string
    add_column :clients, :client_type2, :string
  end
end
