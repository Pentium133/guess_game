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
#

class Stage < ActiveRecord::Base
  belongs_to :race
  has_many :stage_results
  has_many :stage_predicts

  accepts_nested_attributes_for :stage_results
  accepts_nested_attributes_for :stage_predicts

  enum stage_type: [ :race, :itt, :ttt ]

  def stage_type_enum
    [ :race, :itt, :ttt ]
  end

  def calculate_scores
    stage_results.each do |result|
      logger.debug "Result: #{result.finisher_id}"
      unless result.finisher_id.to_s == ''
        stage_predicts.where(finisher_id: result.finisher_id, finisher_type: result.finisher_type).each do |predict|
          predict.score = StagePredict.score_table_6[predict.place-1][result.place-1]
          logger.debug "Predict:#{predict.place} Result: #{result.place} Score: #{predict.score}"
          predict.guessed = predict.place == result.place
          predict.save
        end
      end
    end
  end
end
