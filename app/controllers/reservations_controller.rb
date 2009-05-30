class ReservationsController < ApplicationController
  
  def index
    if params[:id].nil? then
      render :template => 'select_deputation'
    else
      render :template => 'select_time'
    end
  end
  
end