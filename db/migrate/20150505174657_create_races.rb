class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.integer :season_id
      t.date :start_at
      t.date :end_at

      t.timestamps null: false
    end
  end
end
