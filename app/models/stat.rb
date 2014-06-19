class Stat < ActiveRecord::Base
  attr_accessible :badgesUnlocked, :challengesCompleted, :factsCompleted, :rewardsUnlocked, :level, :experience,:alltime,:daily,:weekly,:monthly
  belongs_to :user
end
