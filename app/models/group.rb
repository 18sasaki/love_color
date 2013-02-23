class Group < ActiveRecord::Base
  attr_accessible :deleted, :name, :sort, :view_name
end
