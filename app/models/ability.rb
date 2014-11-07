class Ability
  include CanCan::Ability

  def initialize(current_user)

       current_user ||= User.new
       if current_user.admin?
         can :manage, :all
       else
         can :read, Email
         can :write, Email
       end

  end
end
