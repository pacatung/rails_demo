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
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.build
  end

  def create
    @event = Event.find(params[:event_id])

    @attendee = @event.attendees.build(attendee_params)
    if @attendee.save
      redirect_to event_attendees_path, :method => :get
    else
      render new_event_attendee_path(@event), :method => :get
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected

  def find_event
    @event=Event.find([:event_id])
  end

  def attendee_params
    params.require(:attendee).permit(:name)
  end

end
