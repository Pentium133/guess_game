class TeamPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def rails_admin?(action)
    user.manager? or user.admin?
  end
end