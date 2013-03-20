class Group < ActiveRecord::Base
  attr_accessible :deleted, :name, :sort, :view_name
  has_many :members, :conditions => ["members.deleted = 0"]

  def name_disp
  	count = Member.count(:all, :conditions => ['group_id = ? and deleted = 0', id])
  	"#{view_name} (#{count})"
  end
end
