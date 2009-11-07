class MinistersController < ApplicationController
  layout nil

  # GET /ministers
  def index
		sortby = params[:sort] || 'lastname'
    sortdir = params[:d] || 'ASC'

    @ministers = Minister.find(:all,
      :conditions => "status = 'active'",
      :order => "#{sortby} #{sortdir}"
    )

    respond_to do |format|
      format.html
    end
  end

end
