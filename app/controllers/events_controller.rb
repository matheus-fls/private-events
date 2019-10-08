class EventsController < ApplicationController
  def new
  end

  def create 
    @event = current_user.events.build(params_event)
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
