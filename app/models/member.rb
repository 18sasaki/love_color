class Member < ActiveRecord::Base
  attr_accessible :center_flg, :color_id, :deleted, :graduation_flg, :group_id, :name, :push_flg, :view_name

  belongs_to :color
  belongs_to :group

end
