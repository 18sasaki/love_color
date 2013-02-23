class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :view_name
      t.integer :group_id
      t.integer :color_id
      t.integer :push_flg
      t.integer :center_flg
      t.integer :graduation_flg
      t.integer :deleted

      t.timestamps
    end
  end
end
