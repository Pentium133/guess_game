class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def index
    @teams = Team.all
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:short_name, :logo)
    end
end
