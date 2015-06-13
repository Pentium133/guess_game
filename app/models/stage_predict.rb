# == Schema Information
#
# Table name: stage_predicts
#
#  id            :integer          not null, primary key
#  stage_id      :integer
#  user_id       :integer
#  place         :integer
#  score         :integer          default(0)
#  guessed       :boolean          default(FALSE)
#  finisher_id   :integer
#  finisher_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class StagePredict < ActiveRecord::Base
  belongs_to :stage
  belongs_to :finisher, polymorphic: true
  belongs_to :user

  scope :guessed_predict, -> { where(guessed: 1) }
  default_scope { order('place') }

  def StagePredict.score_table_6
    score = [[18, 16, 15, 14, 13, 12],
             [13, 14, 13, 12, 11, 10],
             [10, 11, 12, 11, 10,  9],
             [ 5,  6,  7,  8,  7,  6],
             [ 2,  3,  4,  5,  6,  5],
             [ 1,  1,  2,  2,  3,  4]]
    return score
  end
end
