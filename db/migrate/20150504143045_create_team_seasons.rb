class CreateTeamSeasons < ActiveRecord::Migration
  def change
    create_table :team_seasons do |t|
      t.integer :team_id
      t.integer :season_id
      t.string :name
      t.string :logo

      t.timestamps null: false
    end
  end
end
