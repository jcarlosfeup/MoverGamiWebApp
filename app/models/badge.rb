class Badge < ActiveRecord::Base
  attr_accessible :description, :image, :name, :restriction
  belongs_to :restriction, :dependent => :destroy

  accepts_nested_attributes_for :restriction
end
