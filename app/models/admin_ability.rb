class AdminAbility
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    if user.has_role? :admin 
      can :manage, :all
      can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
    end

  end
end