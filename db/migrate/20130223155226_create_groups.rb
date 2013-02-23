class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :view_name
      t.integer :sort
      t.integer :deleted

      t.timestamps
    end
  end
end
