class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.order(start_at: :desc).all

    @page_title = I18n.t 'menu.tournaments'
    add_breadcrumb @page_title
  end

  def show
    @tournament = Tournament.friendly.find(params[:id])
    @page_title = @tournament.name

    add_breadcrumb I18n.t('menu.tournaments'), :tournaments_path
    add_breadcrumb @tournament.name
  end

end
