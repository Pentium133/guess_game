# == Schema Information
#
# Table name: riders
#
#  id         :integer          not null, primary key
#  last_name  :string(255)
#  first_name :string(255)
#  country    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rider < ActiveRecord::Base
  has_many :stage_results, as: :finisher

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def to_s
    self.name
  end
end
