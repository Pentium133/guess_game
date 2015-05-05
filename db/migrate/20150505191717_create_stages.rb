class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :stage_number
      t.integer :race_id
      t.integer :stage_type, default: 0
      t.datetime :start_at

      t.timestamps null: false
    end
  end
end
