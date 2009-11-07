class Admin::ChurchesController < ApplicationController
  layout "admin"
  before_filter :login_required

  # GET /churches
  def index

		sortby = params[:sort] || 'church_name'
    sortdir = params[:d] || 'ASC'

    @churches = Church.paginate(:all,
      :conditions => "status = 'active'",
      :page => params[:page],
      :per_page => 25,
      :order => "#{sortby} #{sortdir}"
    )

    @half_way = (@churches.length/2).round

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /churches/1
  def show
    @church = Church.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /churches/new
  def new
    @church = Church.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /churches/1/edit
  def edit
    @church = Church.find(params[:id])
  end

  # POST /churches
  def create
    @church = Church.new(params[:church])

    respond_to do |format|
      if @church.save
        flash[:notice] = 'Church was successfully created.'
        format.html { redirect_to(@church) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /churches/1
  def update
    @church = Church.find(params[:id])

    respond_to do |format|
      if @church.update_attributes(params[:church])
        flash[:notice] = 'Church was successfully updated.'
        format.html { redirect_to(@church) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /churches/1
  def destroy
    @church = Church.find(params[:id])
    @church.destroy

    respond_to do |format|
      format.html { redirect_to(churches_url) }
    end
  end
end
