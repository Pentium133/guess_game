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
