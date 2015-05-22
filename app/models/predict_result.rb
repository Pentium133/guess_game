# == Schema Information
#
# Table name: predict_results
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  stage_id   :integer
#  is_online  :boolean          default(FALSE)
#  score      :integer
#  comment    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PredictResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :stage
end
