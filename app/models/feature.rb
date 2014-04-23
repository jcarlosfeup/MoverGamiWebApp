class Feature < ActiveRecord::Base
  attr_accessible :name
  has_many :restrictions

  

end
