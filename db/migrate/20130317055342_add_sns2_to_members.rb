class AddSns2ToMembers < ActiveRecord::Migration
  def change
    add_column :members, :blog_url, :string
    add_column :members, :blog_name, :string
  end
end
