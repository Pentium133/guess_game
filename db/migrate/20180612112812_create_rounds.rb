class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :tournament_id
      t.string :name
      t.string :slug
      t.date :start_at
      t.integer :multiplier

      t.timestamps null: false
    end
  end
end
