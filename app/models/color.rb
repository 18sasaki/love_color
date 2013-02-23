class Color < ActiveRecord::Base
  attr_accessible :deleted, :name, :rgb, :sort, :view_name
end
