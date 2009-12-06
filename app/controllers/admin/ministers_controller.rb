class Admin::MinistersController < ApplicationController
  layout "fhview"
  before_filter :login_required

  # GET /ministers
  def index

    @admin_menu = true

    per_page = params[:pp] || 40

		if params[:sort] == 'active'
				@ministers = Minister.paginate_by_status 'active', 
          :page => params[:page], 
          :per_page => per_page, 
          :order => 'lastname ASC'
		else 
				@ministers = Minister.paginate :all,
          :page => params[:page], 
          :per_page => per_page , 
          :order => 'lastname ASC'
		end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /ministers/1
  def show
    @minister = Minister.find(params[:id])

    @admin_menu = true

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /ministers/new
  def new
    @ministers = Minister.new

    @admin_menu = true

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /ministers/1/edit
  def edit
    @ministers = Minister.find(params[:id])
    @admin_menu = true
  end

  # POST /ministers
  def create
    @ministers = Minister.new(params[:ministers])

    respond_to do |format|
      if @ministers.save
        flash[:notice] = 'Ministers was successfully created.'
        format.html { redirect_to(@ministers) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /ministers/1
  def update
    @ministers = Minister.find(params[:id])

    respond_to do |format|
      if @ministers.update_attributes(params[:ministers])
        flash[:notice] = 'Ministers was successfully updated.'
        format.html { redirect_to(@ministers) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /ministers/1
  def destroy
    @ministers = Minister.find(params[:id])
    @ministers.destroy

    respond_to do |format|
      format.html { redirect_to(ministers_url) }
    end
  end
  
end
