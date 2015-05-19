# == Schema Information
#
# Table name: team_seasons
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  season_id  :integer
#  name       :string(255)
#  logo       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamSeason < ActiveRecord::Base
  belongs_to :season
  belongs_to :team

  mount_uploader :logo, TeamLogoUploader
end
