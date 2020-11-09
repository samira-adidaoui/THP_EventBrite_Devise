class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.user = current_user
    if @event.save!
      redirect_to event_path(@event.id)
      flash[:notice] = "Event was successfully create"

    else render :new
      flash[:alert] = "Error : answer to all questions"
    end

  end

  def params_event
    params.require(:event).permit(:user, :start_date, :duration, :title, :description, :price, :location)
  end

  def show
    @event = Event.find(params[:id])
  end
end
