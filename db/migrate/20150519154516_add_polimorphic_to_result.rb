class AddPolimorphicToResult < ActiveRecord::Migration
  def change
    change_table :stage_results do |t|
      t.remove :rider_id
      t.references :finisher, polymorphic: true, index: true
    end
  end
end
