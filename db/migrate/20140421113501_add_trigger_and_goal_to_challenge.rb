class AddTriggerAndGoalToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :trigger_id, :integer
    add_column :challenges, :goal_id, :integer
  end
end
