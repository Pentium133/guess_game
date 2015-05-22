class TeamSeasonPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def import?
    user.admin?
  end

  def rails_admin?(action)
    user.manager? or user.admin?
  end
end