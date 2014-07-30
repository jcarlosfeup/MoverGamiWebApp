class Challenge < ActiveRecord::Base
  attr_accessible :description, :trigger, :goal
  belongs_to :trigger, class_name: 'Restriction', :foreign_key => "trigger_id",  :dependent => :destroy
  belongs_to :goal, class_name: 'Restriction', :foreign_key => "goal_id",  :dependent => :destroy

  #belongs_to :restriction, :dependent => :destroy

  accepts_nested_attributes_for :trigger, :goal
end
