# == Schema Information
#
# Table name: rounds
#
#  id            :integer          not null, primary key
#  tournament_id :integer
#  name          :string(255)
#  start_at      :date
#  multiplier    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Round < ActiveRecord::Base
  belongs_to :tournament
  has_many :matches
end