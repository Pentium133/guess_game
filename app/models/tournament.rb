# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_at   :date
#  end_at     :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tournament < ActiveRecord::Base
end
