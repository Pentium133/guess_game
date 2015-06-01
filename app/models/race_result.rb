# == Schema Information
#
# Table name: race_results
#
#  id          :integer          not null, primary key
#  race_id     :integer
#  user_id     :integer
#  score       :integer
#  result_type :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RaceResult < ActiveRecord::Base
  enum result_type: { overall: 0, sprinter: 1, mountains: 2 }
end
