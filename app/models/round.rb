# == Schema Information
#
# Table name: rounds
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_at   :date
#  multiplier :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Round < ActiveRecord::Base
end
