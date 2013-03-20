class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :key
      t.string :value1
      t.string :value2
      t.integer :deleted, {:default => 0}

      t.timestamps
    end
  end
end
