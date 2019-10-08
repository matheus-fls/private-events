class EventsController < ApplicationController
  def new
  end

  def create 
    @event = Event.new(params_event)
    @event.creator = current_user
    if @event.valid?
      @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  private 

  def params_event
    params.require(:event).permit(:name, :description, :date)
  end
end
