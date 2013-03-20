class ColorsController < ApplicationController
  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.find(:all, :order => 'sort', :conditions => 'deleted = 0')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colors }
    end
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
    @color = Color.find(params[:id])
    @members = Member.find(:all, :conditions => ["color_id = ? and deleted = 0", params[:id]])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @color }
    end
  end

  # GET /colors/new
  # GET /colors/new.json
  def new
    @color = Color.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @color }
    end
  end

  # GET /colors/1/edit
  def edit
    @color = Color.find(params[:id])
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(params[:color])
    new_sort = Configurations.get_sort('color')
    @color.sort = new_sort
    @color.deleted = 0

    respond_to do |format|
      if @color.save
        format.html { redirect_to :colors, notice: 'Color was successfully created.' }
        format.json { render json: @color, status: :created, location: @color }
      else
        format.html { render action: "new" }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colors/1
  # PUT /colors/1.json
  def update
    @color = Color.find(params[:id])

    respond_to do |format|
      if @color.update_attributes(params[:color])
        format.html { redirect_to params[:back_to], notice: 'Color was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    @color = Color.find(params[:id])
    @color.destroy

    respond_to do |format|
      format.html { redirect_to colors_url }
      format.json { head :no_content }
    end
  end

  def sort_change
    target_color = Color.find(params[:id])
    sort_num = target_color.sort

    case params[:s]
    when 'up'
      after_sort_num = sort_num - 1
    when 'down'
      after_sort_num = sort_num + 1
    end

    if change_color = Color.find(:first, :conditions => {:sort => after_sort_num})
      change_color.sort = sort_num
      change_color.save!

      target_color.sort = after_sort_num
      target_color.save!
    end

    redirect_to :colors
  end
end
