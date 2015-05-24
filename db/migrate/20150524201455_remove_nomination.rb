class RemoveNomination < ActiveRecord::Migration
  def change
    change_table :stages do |t|
      t.remove :nomination
    end
  end
end
