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
end
