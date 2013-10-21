class EventsController < ApplicationController
   before_filter :authenticate_user!, except: [:index, :show]

   
  def index
    @events = Event.all
  end

  def new 
  end

end
