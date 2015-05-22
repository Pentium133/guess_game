class CreatePredictResults < ActiveRecord::Migration
  def change
    create_table :predict_results do |t|
      t.integer :user_id
      t.integer :stage_id
      t.boolean :is_online, default: false
      t.integer :score
      t.text :comment

      t.timestamps null: false
    end
  end
end
