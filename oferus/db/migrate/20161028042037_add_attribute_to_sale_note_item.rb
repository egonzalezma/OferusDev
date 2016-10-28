class AddAttributeToSaleNoteItem < ActiveRecord::Migration
  def change
  	add_column :sale_note_items, :order_number, :string
    add_column :sale_note_items, :order_item_line, :integer
    add_column :sale_note_items, :domain, :string
    add_column :sale_note_items, :product_identifier, :string
    add_column :sale_note_items, :product_unit_of_measurement, :string
    add_column :sale_note_items, :order_item_lot, :integer
    add_column :sale_note_items, :order_item_list_price, :integer
    add_column :sale_note_items, :order_item_price, :integer
    add_column :sale_note_items, :order_item_discount, :integer
  end
end

