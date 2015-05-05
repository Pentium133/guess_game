class PagesController < ApplicationController
  def dashboard
    @races = Race.where(season: @current_season).order(:start_at)

    @page_title = 'Dashboard'
  end
end