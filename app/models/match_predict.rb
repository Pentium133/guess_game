# == Schema Information
#
# Table name: match_predicts
#
#  id         :integer          not null, primary key
#  match_id   :integer
#  user_id    :integer
#  score1     :integer
#  score2     :integer
#  score      :integer
#  guessed    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MatchPredict < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  enum guessed: { noguessed: 0, result: 1, draw: 2, score: 3 }

  scope :active, -> { where('score1 IS not null AND score2 IS not null') }

  def scores_str
    if match.is_started?
      score1.to_s + ' : ' + score2.to_s
    else
      'X : X'
    end
  end
end
