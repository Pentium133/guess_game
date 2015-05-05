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
end
