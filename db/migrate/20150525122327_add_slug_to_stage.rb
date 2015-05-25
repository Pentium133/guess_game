class AddSlugToStage < ActiveRecord::Migration
  def change
    add_column :stages, :slug, :string, unique: true
    add_column :races,  :slug, :string, unique: true
  end
end
