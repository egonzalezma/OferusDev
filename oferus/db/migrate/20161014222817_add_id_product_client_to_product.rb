class AddIdProductClientToProduct < ActiveRecord::Migration
  def change
    add_column :products, :id_product_client, :string
  end
end
