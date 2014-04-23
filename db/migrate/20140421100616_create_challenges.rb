class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :description

      t.timestamps
    end
  end
end
