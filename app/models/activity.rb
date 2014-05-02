class Activity < ActiveRecord::Base
  attr_accessible :name
  has_many :restrictions
end
