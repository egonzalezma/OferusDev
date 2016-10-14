class CreateTeamReports < ActiveRecord::Migration
  def change
    create_table :team_reports do |t|

      t.timestamps null: false
    end
  end
end
