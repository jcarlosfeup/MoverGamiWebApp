class CreateTimeframes < ActiveRecord::Migration
  def change
    create_table :timeframes do |t|
      t.string :type_limit
      t.integer :value

      t.timestamps
    end
  end
end
