class StagePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def calculate?
    user.manager? or user.admin?
  end

  def manage?
    user.admin?
  end
end