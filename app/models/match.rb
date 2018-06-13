# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  round_id   :integer
#  team1      :string(255)
#  score1     :integer
#  team2      :string(255)
#  score2     :integer
#  start_at   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Match < ActiveRecord::Base
  belongs_to :round
end
