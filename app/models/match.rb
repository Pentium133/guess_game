# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  round_id   :integer
#  team1      :string(255)
#  score1     :integer          default(-1)
#  team2      :string(255)
#  score2     :integer          default(-1)
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Match < ActiveRecord::Base
  belongs_to :round
  has_many :match_predicts

  after_save do |match|
    MatchPredict.record_timestamps = false
    if score2 >= 0 && score1 >= 0
      match_predicts.each do |match_predict|
        if match_predict.score1.present? && match_predict.score2.present?
          if match_predict.score1 == score1 && match_predict.score2 == score2
            match_predict.guessed = 'score'
            match_predict.score = 3
          elsif match_predict.score1 - match_predict.score2 == score1 - score2
            match_predict.guessed = 'difference'
            match_predict.score = 2
          elsif match_predict.score1 > match_predict.score2 && score1 > score2
            match_predict.guessed = 'result'
            match_predict.score = 1
          elsif match_predict.score1 < match_predict.score2 && score1 < score2
            match_predict.guessed = 'result'
            match_predict.score = 1
          else
            match_predict.guessed = 'noguessed'
          end
        end
        match_predict.score = match_predict.score.to_i * match_predict.match.round.multiplier.to_i
        match_predict.save(touch: false)
      end
    end
    MatchPredict.record_timestamps = true
  end

  def score1_str
    if score1 == -1
      '-'
    else
      score1
    end
  end

  def score2_str
    if score2 == -1
      '-'
    else
      score2
    end
  end

  def predict_ready_for?(user)
    pr = match_predicts.where(user_id: user.id).first
    if pr.present? && pr.score1.present? && pr.score2.present?
      true
    else
      false
    end
  end

  def is_started?
    start_at < Time.now
  end
end
