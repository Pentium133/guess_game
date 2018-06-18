class RoundsController < ApplicationController
  def show
    @round = Round.friendly.find(params[:id])
    @page_title = @round.name
    @overall = @round.get_overall

    add_breadcrumb I18n.t('menu.tournaments'), :tournaments_path
    add_breadcrumb @round.tournament.name, tournament_path(@round.tournament)
    add_breadcrumb @round.name
  end

end
