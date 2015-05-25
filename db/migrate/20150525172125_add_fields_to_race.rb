class AddFieldsToRace < ActiveRecord::Migration
  def change
    add_column :races, :race_type, :integer, default: 0
    add_column :races, :is_ready,  :boolean, default: 0
  end
end
