class CreateRaceResults < ActiveRecord::Migration
  def change
    create_table :race_results do |t|
      t.integer :race_id
      t.integer :user_id
      t.integer :score
      t.integer :result_type

      t.timestamps null: false
    end
  end
end
