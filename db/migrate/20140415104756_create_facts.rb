class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :description
      t.references :restriction

      t.timestamps
    end
    add_index :facts, :restriction_id
  end
end
