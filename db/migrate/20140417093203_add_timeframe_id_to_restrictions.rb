class AddTimeframeIdToRestrictions < ActiveRecord::Migration
  def change    
	
	add_column :restrictions, :timeframe_id, :integer
    add_index :restrictions, :timeframe_id
  end
end
