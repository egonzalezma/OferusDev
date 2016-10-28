class CreateSaleNoteItems < ActiveRecord::Migration
  def change
    create_table :sale_note_items do |t|

      t.timestamps null: false
    end
  end
end
