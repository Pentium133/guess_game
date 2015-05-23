class AddPlaceToPredictResult < ActiveRecord::Migration
  def change
    add_column :predict_results, :place, :integer
    add_column :stages, :winner_id, :integer
  end
end
