class CreateSaleFlows < ActiveRecord::Migration
  def change
    create_table :sale_flows do |t|

      t.timestamps null: false
    end
  end
end
