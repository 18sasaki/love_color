class Color < ActiveRecord::Base
  attr_accessible :deleted, :name, :rgb, :sort, :view_name
  has_many :members, :conditions => ["members.deleted = 0"]
end
