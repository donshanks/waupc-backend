class Admin::MinistersController < ApplicationController
  layout "admin"
  before_filter :login_required

  # GET /ministers
  def index

		if params[:sort] == 'active'
				@ministers = Minister.paginate_by_sql [ "SELECT * FROM ministers WHERE status = 'active' ORDER BY lastname ASC" ],
					:page => params[:page], 
					:per_page => 16 
		else 
				@ministers = Minister.paginate :page => params[:page], 
					:per_page => 16, 
					:order => 'lastname ASC'
		end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /ministers/1
  def show
    @minister = Minister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /ministers/new
  def new
    @ministers = Minister.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /ministers/1/edit
  def edit
    @ministers = Minister.find(params[:id])
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
