# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  start_at   :date
#  end_at     :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tournament < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :rounds
end
