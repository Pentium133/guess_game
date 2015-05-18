class CreateStageResults < ActiveRecord::Migration
  def change
    create_table :stage_results do |t|
      t.integer :stage_id
      t.integer :rider_id
      t.integer :place

      t.timestamps null: false
    end
  end
end
