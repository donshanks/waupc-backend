class Admin::DocumentsController < ApplicationController
  layout "admin"
  before_filter :login_required

  # GET /admin_documents
  def index
    @documents = Document.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin_documents/1
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /admin_documents/new
  def new
    @documents = Document.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/documents/1/edit
  def edit
    @documents = Document.find(params[:id])
  end

  # POST /admin/documents
  def create
    pp params
    @documents = Document.new(params[:documents])

    respond_to do |format|
      if @documents.save
        flash[:notice] = 'Document was successfully created.'
        format.html { redirect_to(@documents) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /admin_documents/1
  def update
    @documents = Document.find(params[:id])

    pp  params

    respond_to do |format|
      if @documents.update_attributes(params['document'])
        flash[:notice] = 'Document was successfully updated.'
        format.html { redirect_to(@documents) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
