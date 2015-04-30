class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :code
      t.string :short_name
      t.string :logo
      t.string :country, size: 2

      t.timestamps null: false
    end
  end
end
