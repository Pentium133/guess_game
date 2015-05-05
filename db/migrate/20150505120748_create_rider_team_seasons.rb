class CreateRiderTeamSeasons < ActiveRecord::Migration
  def change
    create_table :rider_team_seasons do |t|
      t.integer :rider_id
      t.integer :team_season_id

      t.timestamps null: false
    end
  end
end
