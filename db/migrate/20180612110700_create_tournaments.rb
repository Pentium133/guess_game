class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :slug
      t.date :start_at
      t.date :end_at

      t.timestamps null: false
    end
  end
end
