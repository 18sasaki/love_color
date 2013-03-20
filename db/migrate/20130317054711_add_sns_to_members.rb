class AddSnsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :wiki, :string
    add_column :members, :twitter, :string
    add_column :members, :blog, :string
  end
end
