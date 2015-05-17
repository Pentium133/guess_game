class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_season

  add_breadcrumb '<i class="fa fa-home fa-2"></i>'.html_safe, :root_path

  def set_season
    @current_season = Season.find_by_name('2015')
  end

end
