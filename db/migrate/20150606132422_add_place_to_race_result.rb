class AddPlaceToRaceResult < ActiveRecord::Migration
  def change
    add_column :race_results, :place, :integer
  end
end
