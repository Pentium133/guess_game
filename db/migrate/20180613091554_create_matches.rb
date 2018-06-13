class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :round_id
      t.string :team1
      t.integer :score1, default: -1
      t.string :team2
      t.integer :score2, default: -1
      t.datetime :start_at

      t.timestamps null: false
    end
  end
end
