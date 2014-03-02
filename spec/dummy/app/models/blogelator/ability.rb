module Blogelator
  class Ability
    include CanCan::Ability

    def initialize(user)
      can :manage, Blogelator::Post
    end
  end
end