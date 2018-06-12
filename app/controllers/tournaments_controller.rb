class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.order(start_at: :desc).all

    @page_title = I18n.t 'menu.tournaments'
    add_breadcrumb @page_title
  end

  def show
    @page_title = @race.name
    add_breadcrumb I18n.t('menu.races'), :races_path
    add_breadcrumb @race.name
  end

end
