module Blogelator
  class Ability
    include CanCan::Ability

    def initialize(user)
      if user
        puts "WAT: #{user}"
        can :manage, Blogelator::Post
      end
    end
  end
end