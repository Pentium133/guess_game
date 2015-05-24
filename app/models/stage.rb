# == Schema Information
#
# Table name: stages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  stage_number :integer
#  race_id      :integer
#  stage_type   :integer          default(0)
#  start_at     :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  winner_id    :integer
#

class Stage < ActiveRecord::Base
  belongs_to :race
  belongs_to :winner, :class_name => User
  has_many :stage_results
  has_many :stage_predicts
  has_many :predict_results

  accepts_nested_attributes_for :stage_results
  accepts_nested_attributes_for :stage_predicts
  accepts_nested_attributes_for :predict_results

  after_initialize :set_default_type, :if => :new_record?

  enum stage_type: [ :race, :itt, :ttt ]
  enum nomination: [ :default, :sprint, :mountins ]

  def set_default_type
    self.stage_type ||= :race
  end

  def stage_type_enum
    Stage.stage_types
  end

  def nomination_enum
    Stage.nominations
  end

  def calculate_scores
    stage_results.each do |result|
      unless result.finisher_id.to_s == ''
        stage_predicts.where(finisher_id: result.finisher_id, finisher_type: result.finisher_type).each do |predict|
          predict.score = StagePredict.score_table_6[result.place-1][predict.place-1]
          predict.guessed = predict.place == result.place
          predict.save
        end
      end
    end

    PredictResult.where(stage_id: self.id).each do |result|
      sum = StagePredict.where(user_id: result.user_id, stage_id: self.id).sum(:score)
      if result.is_online
        result.update_column(:score, (sum / 2.0).round)
      else
        result.update_column(:score, sum )
      end
      result.save
    end

    place = 1
    PredictResult.where(stage_id: self.id,).order(score: :desc).order(:updated_at).each do |result|
      if place == 1 and result.score > 0
        self.winner_id = result.user_id
        self.save
      end
      result.update_column(:place, place)
      place += 1
    end
  end

  def get_overall
    sql = "SELECT users.id, users.username,
                  sum(predict_results.score) as summscore,
                  sum(predict_results.place) as summplace
            FROM predict_results
            JOIN users on user_id = users.id
            JOIN stages on stage_id = stages.id
            WHERE stages.start_at <= '#{self.start_at}'
              AND stages.race_id = #{self.race_id}
            GROUP by predict_results.user_id
            ORDER by summscore desc, summplace asc"
    result = Array.new
    ActiveRecord::Base.connection.execute(sql).each do |row|
      result.push [row[0], row[1], row[2]]
    end
    return result
  end

  def clear_predicts_for(user_id)
    stage_predicts.where(user_id: user_id).delete_all
  end
end
