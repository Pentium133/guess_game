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

  def predict?
    record.start_at > Time.now or user.admin?
  end

  def rails_admin?(action)
    user.manager? or user.admin?
  end
end