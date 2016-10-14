class CreateClientReports < ActiveRecord::Migration
  def change
    create_table :client_reports do |t|

      t.timestamps null: false
    end
  end
end
