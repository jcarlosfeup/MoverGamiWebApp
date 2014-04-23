class AddRestrictionIdToFacts < ActiveRecord::Migration
  def change
	 add_column :facts, :restriction_id, :integer
	 add_index  :facts, :restriction_id
  end
end
