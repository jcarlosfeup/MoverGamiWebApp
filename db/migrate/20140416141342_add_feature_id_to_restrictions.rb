class AddFeatureIdToRestrictions < ActiveRecord::Migration
  def change
    add_column :restrictions, :feature_id, :integer
    add_index :restrictions, :feature_id
  end
end