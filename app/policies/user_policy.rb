class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def rails_admin?(action)
    user.admin?
  end
end