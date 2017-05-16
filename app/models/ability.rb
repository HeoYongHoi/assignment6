class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user(not logged in)
      if user.has_role? :admin # admin 권한
        can :manage, :all
      elsif user.has_role? :moder
        can :read, :all
        can :delete, :all
      else #소시민 권한
        can :read, :all
        can :new, :all
        can :create, :all
        can :manage, Content, user_id: user.id
      end
  end
end