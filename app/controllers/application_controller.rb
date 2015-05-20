class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_season
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_breadcrumb '<i class="fa fa-home fa-2"></i>'.html_safe, :root_path

  protected

  def set_season
    @current_season = Season.find_by_name('2015')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation,
      :current_password, :avatar) }
  end
end
