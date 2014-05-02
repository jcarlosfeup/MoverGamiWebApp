class AddActivityToRestriction < ActiveRecord::Migration
 
 def change
    add_column :restrictions, :activity_id, :integer
    add_index :restrictions, :activity_id
  end
end
