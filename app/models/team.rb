# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  short_name :string(255)
#  logo       :string(255)
#  country    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  mount_uploader :logo, TeamLogoUploader
end
