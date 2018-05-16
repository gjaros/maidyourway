class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, [BlogPost, Comment]

    if user.present?
      can :crud, Comment, user_id: user.id
    end

    if user.worker?
      can :read, [BlogPost, Comment, Job]
    end

    if user.manager?
      can :manage, [BlogPost, Comment, Job]
      can :read, [User]
    end

    if user.admin?
      can :manage, :all
    end

  end

end
