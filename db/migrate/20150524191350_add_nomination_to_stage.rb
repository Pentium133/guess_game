class AddNominationToStage < ActiveRecord::Migration
  def change
    add_column :stages, :nomination, :integer, default: 0
  end
end
