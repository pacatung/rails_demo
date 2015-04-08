class EventAttendeesController < ApplicationController

  before_action :find_event

  def index
    # @event = Event.find(params[:event_id])
    @attendees = @event.attendees
  end

  def show
    # @event = Event.find(params[:event_id])
    # @attendee = Attendees.find(params[:id]) 有安全性疑慮
    @attendee = @event.attendees.find(params[:id])
  end

  def new
    # @event = Event.find(params[:event_id])
    @attendee = @event.attendees.build
  end

  def create
    # @event = Event.find(params[:event_id])

    @attendee = @event.attendees.build(attendee_params)
    if @attendee.save
      redirect_to event_attendees_path, :method => :get
    else
      render new_event_attendee_path(@event), :method => :get
      # render :action => :new
    end
  end

  def edit
    # @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find(params[:id])

  end

  def update
    # @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find(params[:id])

    if @attendee.update(attendee_params)
      redirect_to event_attendees_path(@event), :method=>:get
    else
      render edit_event_attendee_path, :method => :get
    end
  end

  def destroy
    # @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find(params[:id])
    @attendee.destroy

    redirect_to event_attendees_url( @event )
  end

  protected

  def find_event
    @event=Event.find(params[:event_id])
  end

  def attendee_params
    params.require(:attendee).permit(:name)
  end

end
