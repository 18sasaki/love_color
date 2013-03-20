class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.find(:all, :order => 'sort', :conditions => 'deleted = 0')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @members = Member.find(:all, :conditions => ["group_id = ? and deleted = 0", params[:id]])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    new_sort = Configurations.get_sort('group')
    @group.sort = new_sort
    @group.deleted = 0

    respond_to do |format|
      if @group.save
        format.html { redirect_to :groups, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to params[:back_to], notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def sort_change
    target_group = Group.find(params[:id])
    sort_num = target_group.sort

    case params[:s]
    when 'up'
      after_sort_num = sort_num - 1
    when 'down'
      after_sort_num = sort_num + 1
    end

    if change_grpup = Group.find(:first, :conditions => {:sort => after_sort_num})
      change_grpup.sort = sort_num
      change_grpup.save!

      target_group.sort = after_sort_num
      target_group.save!
    end

    redirect_to :groups
  end
end
