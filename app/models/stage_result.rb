# == Schema Information
#
# Table name: stage_results
#
#  id            :integer          not null, primary key
#  stage_id      :integer
#  place         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  finisher_id   :integer
#  finisher_type :string(255)
#

class StageResult < ActiveRecord::Base
  belongs_to :stage
  belongs_to :finisher, polymorphic: true

  default_scope { order('place') }
end
