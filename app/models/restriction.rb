class Restriction < ActiveRecord::Base
  attr_accessible :threshold, :feature
  has_many :facts
  has_many :badges
  has_many :challenges
  belongs_to :feature
  belongs_to :timeframe
  
  accepts_nested_attributes_for :feature, :timeframe

  validates :threshold, presence: true, :numericality => {:greater_than => 0}
  validates :feature, presence: true
	
end
