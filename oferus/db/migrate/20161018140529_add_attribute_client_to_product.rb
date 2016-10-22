class AddAttributeClientToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_name1, :string
    add_column :products, :product_name2, :string
    add_column :products, :product_name3, :string
    add_column :products, :product_unit_of_measurement, :string
    add_column :products, :product_stock_keeping_unit, :string
    add_column :products, :product_line, :string
    add_column :products, :product_group, :string
    add_column :products, :product_type, :string
    add_column :products, :product_cellar_location, :string
    add_column :products, :product_normal_price, :decimal
    add_column :products, :product_branch_office, :string
    add_column :products, :product_stock, :decimal
    add_column :products, :domain, :string
    add_column :products, :product_identifier, :string
    add_column :products, :product_minimum_price, :decimal
  end
end
