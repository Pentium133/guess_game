module UserHelper
  def link_to_user(user)
    link_to user, user_path(user)
  end
end