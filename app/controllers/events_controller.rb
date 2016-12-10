class EventsController < ApplicationController
  layout 'fhview2'

  # m.display_events '/events'
  def index
    @events = Event.find(:all)
    render
  end

  # m.display_event  '/events/:key(.:format)'
  def show
    @event = Event.find_by_key(params[:key])

    if !@event then
      render :status => 404
    else
      @streams = Stream.find_all_by_event_id(@event.id)
      render
    end
  end

  # m.stream_event   '/events/:key/stream(.:format)'
  def stream
    @event = Event.find_by_key(params[:key])

    if !@event || params[:id].blank? then
      render :status => 404
    else
      @stream = Stream.find_by_id(params[:id])      
      render
    end
  end

  # m.archive_event '/events/:key/archives.:format'
  def archive
    @event = Event.find_by_key(params[:key])

    if !@event then
      render :status => 404
    else
      @streams = Stream.find_all_by_event_id(@event.id)
      render 
    end
  end

  # m.gallery_event '/events/:key/gallery.:format'
  def gallery
    @event = Event.find_by_key(params[:key])

    if !@event then
      render :status => 404
    else
      render
    end
  end

end
