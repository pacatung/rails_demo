class EventAttendeesController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @attendees = @event.attendees
  end

  def show
    @event = Event.find(params[:event_id])
    # @attendee = Attendees.find(params[:id])
    @attendee = @event.attendees.find(params[:id])
  end

  def new

  end

  protected

  def find_event

  end

  def event_params

  end

end
