class Reward < ActiveRecord::Base
  attr_accessible :name,:level, :url, :unlocked, :user_id

  validates :level, presence: true
  validates :name, presence: true
  validates :url, presence: true

  before_save :default_values
  
  def default_values
    self.unlocked ||= '0'
  end
end
