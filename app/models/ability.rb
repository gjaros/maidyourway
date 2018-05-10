class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, [BlogPost, Comment]

    if user.present?
      can :crud, Comment, user_id: user.id
    end

    if user.worker?
      can :read, [BlogPost, Comment]
    end

    if user.manager?
      can :manage, [BlogPost, Comment]
      can :read, [User]
    end

    if user.admin?
      can :manage, :all
    end

  end

end
