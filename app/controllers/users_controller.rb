class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @page_title = "#{@user.username}"
    add_breadcrumb I18n.t 'menu.users'
    add_breadcrumb @user.username
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:show)
    end
end
