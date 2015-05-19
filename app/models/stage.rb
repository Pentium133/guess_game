# == Schema Information
#
# Table name: stages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  stage_number :integer
#  race_id      :integer
#  stage_type   :integer          default(0)
#  start_at     :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Stage < ActiveRecord::Base
  belongs_to :race
  has_many :stage_results
  accepts_nested_attributes_for :stage_results

  enum stage_type: [ :race, :itt, :ttt ]

  def stage_type_enum
    [ :race, :itt, :ttt ]
  end
end
