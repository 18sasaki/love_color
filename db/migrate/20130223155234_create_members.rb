class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :view_name
      t.integer :group_id
      t.integer :color_id
      t.integer :push_flg, {:default => 0}
      t.integer :center_flg, {:default => 0}
      t.integer :graduation_flg, {:default => 0}
      t.integer :deleted, {:default => 0}

      t.timestamps
    end
  end
end
