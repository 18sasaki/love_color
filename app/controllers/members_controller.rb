class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.find(:all, :conditions => 'deleted = 0')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    @group = Group.find(params[:group_id])
    @colors = Color.find(:all, :conditions => 'deleted = 0')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    @group = @member.group
    @colors = Color.find(:all, :conditions => 'deleted = 0')
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
    @member.deleted = 0

    respond_to do |format|
      if @member.save
        format.html { redirect_to group_path(@member.group_id), notice: 'Member was successfully created.' }
#        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
p ">>>>>>>>>>>>>>>>>>#{params[:back_to]}"
        format.html { redirect_to params[:back_to], notice: 'Member was successfully updated.' }
#        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end
