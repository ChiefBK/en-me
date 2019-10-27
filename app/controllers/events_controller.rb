

class EventsController < ApplicationController
  def index
    test = { a: 1, b: 2}

    render json: test
  end

  def create
    raise Error::Responses::InvalidParamsError.new "the message"

    Event.new do |e|
      e.name = params[:name]
    end

  end
end
