class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :url
      t.string :type

      t.timestamps
    end
  end
end
