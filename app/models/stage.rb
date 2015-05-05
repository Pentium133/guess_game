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

  enum stage_type: [ :race, :itt, :ttt ]

  def stage_type_enum
    [ :race, :itt, :ttt ]
  end
end
