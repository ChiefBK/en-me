class EventsController < AccessManagementController
  def index
    events = Event.all

    render json: events
  end

  def create
    event_name = params[:name]
    location_id = params[:location_id]

    event = Event.new do |e|
      e.name = event_name
    end

    event.save

    unless event.errors.size == 0
      raise Error::Responses::InvalidParamsError.new "There was a problem creating your event"
    end

    head :created
  end
end
