class EventsController < ApplicationController

  #GET /events/index
  def index
    #Event 是model name
    @events = Event.all
  end

end
