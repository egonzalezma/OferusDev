class CreateUserReports < ActiveRecord::Migration
  def change
    create_table :user_reports do |t|

      t.timestamps null: false
    end
  end
end
