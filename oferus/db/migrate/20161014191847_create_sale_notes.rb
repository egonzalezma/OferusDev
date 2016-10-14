class CreateSaleNotes < ActiveRecord::Migration
  def change
    create_table :sale_notes do |t|

      t.timestamps null: false
    end
  end
end
