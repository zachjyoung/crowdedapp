class EventsController < ApplicationController
   before_filter :authenticate_user!, except: [:index, :show]


  def index
    @events = Event.all
  end

  def new 
    @event = Event.new
  end


  def edit  
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event was successfully updated.' 
    else
      render action: 'edit'
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else 
      render action: 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :severity, :description)
  end


end
