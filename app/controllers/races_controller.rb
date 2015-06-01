class RacesController < ApplicationController
  before_action :set_race, only: [:show]

  def index
    @races = Race.order(:start_at).all

    @page_title = I18n.t 'menu.races'
    add_breadcrumb @page_title
  end

  def show
    @overall = @race.get_overall
    @overall_spriners = @race.get_overall_sprinters
    @overall_mountains = @race.get_overall_mountains

    @page_title = @race.name
    add_breadcrumb I18n.t('menu.races'), :races_path
    add_breadcrumb @race.name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race
      @race = Race.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def race_params
      params.require(:race).permit(:name, :start_at, :end_at)
    end
end
