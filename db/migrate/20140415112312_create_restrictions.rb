class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.decimal :threshold
      t.references :feature

      t.timestamps
    end
    add_index :features, :feature_id
  end
end
