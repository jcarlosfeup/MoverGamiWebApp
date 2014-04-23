class Fact < ActiveRecord::Base
  attr_accessible :description, :restriction
  belongs_to :restriction, :dependent => :destroy

  accepts_nested_attributes_for :restriction

end
