class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.decimal :badgesUnlocked
      t.decimal :factsCompleted
      t.decimal :rewardsUnlocked
      t.decimal :challengesCompleted

      t.timestamps
    end
  end
end
