class EventsController < ApplicationController
  layout 'fhview2'

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

  def stream
  end

  def stream_archive
  end

  def picasa
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
