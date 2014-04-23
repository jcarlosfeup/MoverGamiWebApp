class Timeframe < ActiveRecord::Base
  attr_accessible :type_limit, :value
  has_many :restrictions

end
