class TeamSeasonsController < ApplicationController
  before_action :set_team, only: [:show, :import]

  def index
    @teams = TeamSeason.includes(:team).where(season: @current_season)
  end

  def show
  end

  def import
    if request.request_parameters[:riders].present?
      csv = CSV.parse(request.request_parameters[:riders], :headers => false)
      counter = 0
      csv.each do |row|
        unless Rider.find_by(last_name: row[0], first_name: row[1])
          Rider.create last_name: row[0], first_name: row[1]
          counter += 1
        end
        flash[:notice] = "#{counter} imported."
      end
    end
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
