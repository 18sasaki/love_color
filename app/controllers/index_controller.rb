class IndexController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @colors = Color.find(:all, :order => 'sort')
    @groups = Group.all

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
