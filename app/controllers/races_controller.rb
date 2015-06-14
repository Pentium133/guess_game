class RacesController < ApplicationController
  before_action :set_race, only: [:show, :calculate]

  def index
    @races = Race.order(:start_at).all

    @page_title = I18n.t 'menu.races'
    add_breadcrumb @page_title
  end

  def show
    if @race.race_results.any?
      @result_ready = true
      @overall = @race.get_overall_result 0
      @overall_spriners = @race.get_overall_result 1
      @overall_mountains = @race.get_overall_result 2
    else
      @result_ready = false
      @overall = @race.get_overall
      @overall_spriners = @race.get_overall_sprinters
      @overall_mountains = @race.get_overall_mountains
    end

    @page_title = @race.name
    add_breadcrumb I18n.t('menu.races'), :races_path
    add_breadcrumb @race.name
  end

  def calculate
    @race.get_overall.each_with_index do |user, index|
      rr = RaceResult.find_or_create_by race_id: @race.id, user_id: user[3], result_type: 0
      rr.score = user[2]
      rr.place = index+1
      rr.save
    end

    @race.get_overall_sprinters.each_with_index do |user, index|
      rr = RaceResult.find_or_create_by race_id: @race.id, user_id: user[3], result_type: 1
      rr.score = user[2]
      rr.place = index+1
      rr.save
    end

    @race.get_overall_mountains.each_with_index do |user, index|
      rr = RaceResult.find_or_create_by race_id: @race.id, user_id: user[3], result_type: 2
      rr.score = user[2]
      rr.place = index+1
      rr.save
    end

    redirect_to @race
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
