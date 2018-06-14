class CreateMatchPredicts < ActiveRecord::Migration
  def change
    create_table :match_predicts do |t|
      t.integer :match_id
      t.integer :user_id
      t.integer :score1
      t.integer :score2
      t.integer :score
      t.integer :guessed

      t.timestamps null: false
    end
  end
end
