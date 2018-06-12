class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :name
      t.date :start_at
      t.integer :multiplier

      t.timestamps null: false
    end
  end
end
