class CreateProductBrands < ActiveRecord::Migration
  def change
    create_table :product_brands do |t|

      t.timestamps null: false
    end
  end
end
