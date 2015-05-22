class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def rails_admin?(action)
    case action
      when :dashboard
        user.admin? or user.manager?
      when :index
        user.admin? or user.manager?
      when :show
        user.admin? or user.manager?
      when :new
        user.admin? or user.manager?
      when :edit
        user.admin? or user.manager?
      when :destroy
        user.admin?
      when :export
        user.admin?
      when :history
        user.admin?
      when :show_in_app
        user.admin?
      else
        raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end
end

