class CreateOfficeReports < ActiveRecord::Migration
  def change
    create_table :office_reports do |t|

      t.timestamps null: false
    end
  end
end
