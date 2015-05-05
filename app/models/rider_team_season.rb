# == Schema Information
#
# Table name: rider_team_seasons
#
#  id             :integer          not null, primary key
#  rider_id       :integer
#  team_season_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class RiderTeamSeason < ActiveRecord::Base
  belongs_to :team_season
  belongs_to :rider
end
