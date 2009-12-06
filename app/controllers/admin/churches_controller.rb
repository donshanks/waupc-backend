class Admin::ChurchesController < ApplicationController
  layout "fhview"
  before_filter :login_required

  # GET /churches
  def index

    @admin_menu = true
    @pageTitle = 'Washington District UPC Churches'

		sortby = params[:sort] || 'church_name'
    sortdir = params[:d] || 'ASC'

    @churches = Church.paginate(:all,
      :conditions => "status = 'active'",
      :page => params[:page],
      :per_page => 20,
      :order => "#{sortby} #{sortdir}"
    )

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /churches/1
  def show
    @church = Church.find(params[:id])

    @admin_menu = true
    @pageTitle = 'Washington District UPC Church Information'

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /churches/new
  def new
    @church = Church.new

    @admin_menu = true
    @pageTitle = 'Washington District UPC Church Information'

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /churches/1/edit
  def edit
    @church = Church.find(params[:id])

    @admin_menu = true
    @pageTitle = 'Washington District UPC Church Information'
  end

  # POST /churches
  def create
    @church = Church.new(params[:church])

    @admin_menu = true
    @pageTitle = 'Washington District UPC Church Information'

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

    @admin_menu = true
    @pageTitle = 'Washington District UPC Church Information'

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
#  def destroy
#    @church = Church.find(params[:id])
#    @church.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(churches_url) }
#    end
#  end

end
