class TeamSeasonsController < ApplicationController
  before_action :set_team, only: [:show, :import]

  def index
    @teams = TeamSeason.includes(:team).where(season: @current_season)

    @page_title = 'Teams'
    add_breadcrumb 'Teams'
  end

  def show
    @page_title = @team.name
    add_breadcrumb 'Teams', team_seasons_path
    add_breadcrumb @team.name
  end

  def import
    add_breadcrumb 'Teams', team_seasons_path
    add_breadcrumb @team.name, team_season_path(@team)
    add_breadcrumb 'Import'

    # from CVS
    if request.request_parameters[:riders].present?
      csv = CSV.parse(request.request_parameters[:riders], :headers => false)
      counter = teamates = 0
      csv.each do |row|
        rider = Rider.find_or_create_by(last_name: row[0].strip, first_name: row[1].strip)
        RiderTeamSeason.find_or_create_by(rider_id: rider.id, team_season_id: @team.id) do |tmp|
          teamates += 1
        end
        flash.now[:notice] = " #{teamates} teamates added."
      end
    end
    # from http://www.procyclingstats.com/
    if request.request_parameters[:url].present?
      doc = Nokogiri::HTML(open(request.request_parameters[:url]))
      doc.css('div.wrapper div.content div div a').each do |item|
        params[:riders] += item.text + "\n"
      end
      params[:url] = ''
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
