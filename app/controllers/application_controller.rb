class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :set_season
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  add_breadcrumb '<i class="fa fa-home fa-2"></i>'.html_safe, :root_path

  protected

  def set_season
    @current_season = Season.find_by_name('2015')
  end

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_accept_language_header
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation,
      :current_password, :avatar) }
  end

  def extract_locale_from_accept_language_header
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    unless I18n.available_locales.include? locale.to_sym
      I18n.default_locale
    else
      locale
    end
  end

end
