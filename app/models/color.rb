class Color < ActiveRecord::Base
  attr_accessible :deleted, :name, :rgb, :sort, :view_name
  has_many :members, :conditions => ["members.deleted = 0"]

  def name_disp
  	count = Member.count(:all, :conditions => ['color_id = ? and deleted = 0', id])
  	"#{view_name} (#{count})"
  end
end
