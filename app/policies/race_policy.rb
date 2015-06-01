class RacePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def calculate?
    user.present? and (user.manager? or user.admin?)
  end

  def rails_admin?(action)
    user.manager? or user.admin?
  end
end