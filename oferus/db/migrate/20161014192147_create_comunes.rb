class CreateComunes < ActiveRecord::Migration
  def change
    create_table :comunes do |t|

      t.timestamps null: false
    end
  end
end
