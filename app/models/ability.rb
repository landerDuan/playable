class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new

    if user.is_admin?
      can :manage, :all
    else

      can :manage, Event  if user.can_manage_events?
      can :manage, Report if user.can_manage_reports?

      can [:read, :create], Event if user.has_role?('event_user')
      can :manage, Report, :user_id => user.id
      can :manage, Post, :user_id => user.id

    end
    
  end
end
