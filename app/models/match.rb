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
end
