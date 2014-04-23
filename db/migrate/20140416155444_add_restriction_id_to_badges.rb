class AddRestrictionIdToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :restriction_id, :integer
    add_index :badges, :restriction_id
  end
end
