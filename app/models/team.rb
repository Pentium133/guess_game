# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  short_name :string(255)
#  country    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :stage_results, as: :finisher

  def name
    short_name
  end

  def to_s
    short_name
  end
end
