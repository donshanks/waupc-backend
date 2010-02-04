class EventsController < ApplicationController
  layout 'fhview'

  def index
    @event = Event.find_by_key(params[:key])
    if !@event then
      @event = Event.find(params[:key])
    end

    if !@event then
      respond :status => 404
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
