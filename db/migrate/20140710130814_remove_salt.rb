class RemoveSalt < ActiveRecord::Migration
  def up
  	remove_column :users, :salt
  end

 end
