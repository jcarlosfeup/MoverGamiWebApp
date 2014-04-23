class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def up
    remove_column :challenges, :trigger
    remove_column :challenges, :goal
  end

  def down
    add_column :challenges, :goal, :integer
    add_column :challenges, :trigger, :integer
  end
end
