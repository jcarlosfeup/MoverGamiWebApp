class AddNewFieldsToRewards < ActiveRecord::Migration
  def change

  	add_column :rewards, :user_id, :integer
  	add_column :rewards, :unlocked, :integer
  end
end
