class ConvertNomination < ActiveRecord::Migration
  def up
    Stage.all.each do |stage|
      if stage.nomination == 'sprint'
        stage.stage_type = 'sprint2'
      end
      if stage.nomination == 'mountains'
        stage.stage_type = 'mountains2'
      end
      stage.save
    end
  end

  def down
  end
end
