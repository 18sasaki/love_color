class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :view_name
      t.integer :sort
      t.integer :deleted, {:default => 0}

      t.timestamps
    end
  end
end
