class RemoveBlogFromMembers < ActiveRecord::Migration
  def up
    remove_column :members, :blog
  end

  def down
    add_column :members, :blog, :string
  end
end
