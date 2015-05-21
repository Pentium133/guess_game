class CreateStagePredicts < ActiveRecord::Migration
  def change
    create_table :stage_predicts do |t|
      t.integer :stage_id
      t.integer :user_id
      t.integer :place
      t.integer :score, default: 0
      t.boolean :guessed, default: false
      t.references :finisher, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
