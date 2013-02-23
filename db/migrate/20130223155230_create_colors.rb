class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :view_name
      t.string :rgb
      t.integer :sort
      t.integer :deleted, {:default => 0}

      t.timestamps
    end
  end
end
