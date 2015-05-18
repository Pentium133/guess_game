# == Schema Information
#
# Table name: stage_results
#
#  id         :integer          not null, primary key
#  stage_id   :integer
#  rider_id   :integer
#  place      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StageResult < ActiveRecord::Base
  belongs_to :stage
  belongs_to :rider

  default_scope { order('place') }
end
