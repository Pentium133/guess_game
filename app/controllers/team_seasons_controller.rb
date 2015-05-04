class TeamSeasonsController < ApplicationController
  before_action :set_team, only: [:show]

  def index
    @teams = TeamSeason.includes(:team).where(season: @current_season)
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = TeamSeason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:short_name, :logo)
    end
end
