class AddProfileToStage < ActiveRecord::Migration
  def change
    add_column :stages, :profile, :string
  end
end
