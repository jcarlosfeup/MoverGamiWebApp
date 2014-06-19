class AddFieldsToStats < ActiveRecord::Migration
  def change
  	add_column :stats, :alltime, :text
  	add_column :stats, :daily, :text
  	add_column :stats, :weekly, :text
  	add_column :stats, :monthly, :text
  end
end
