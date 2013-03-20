class IndexController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    p params[:c]
    p params[:g]

    if pg = params[:g]
      @selected_members = Member.find(:all, :conditions => ['group_id = ? and deleted = 0', pg])

      color_cond = []
      @selected_members.each do |member|
        color_cond << member.color_id
      end
      color_cond = 'dummy' if color_cond.blank?

      @colors1 = Color.find(:all, :conditions => ['id in (?) and deleted = 0', color_cond], :order => 'sort')
      @colors2 = Color.find(:all, :conditions => ['not id in (?) and deleted = 0', color_cond], :order => 'sort')
      @colors  = @colors1 + @colors2
    else
      @colors = Color.find(:all, :order => 'sort', :conditions => 'deleted = 0')
    end

    if pc = params[:c]
      @selected_members = Member.find(:all, :conditions => ['color_id = ? and deleted = 0', pc])

      group_cond = []
      @selected_members.each do |member|
        group_cond << member.group_id
      end
      group_cond = 'dummy' if group_cond.blank?

      @groups1 = Group.find(:all, :conditions => ['id in (?) and deleted = 0', group_cond], :order => 'sort')
      @groups2 = Group.find(:all, :conditions => ['not id in (?) and deleted = 0', group_cond], :order => 'sort')
      @groups  = @groups1 + @groups2
    else
      @groups = Group.find(:all, :order => 'sort', :conditions => 'deleted = 0')
    end


    @members = {}
    @groups.each do |group|
      group_hash = {}
      group_members = group.members
      @colors.each do |color|
        group_members.each do |g_member|
          if g_member.color_id == color.id
            group_hash[color.id] = g_member
            break
          end
        end
      end
      @members[group.id] = group_hash
    end
  end
end
