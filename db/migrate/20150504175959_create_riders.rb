class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :last_name
      t.string :first_name
      t.string :country, size: 2

      t.timestamps null: false
    end
  end
end
