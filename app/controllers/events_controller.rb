class EventsController < ApplicationController
  def new
    @event = current_user.events.build()
  end

  def create 
    @event = current_user.events.build(params_event)
    if @event.valid?
      @event.save
      @attendance = Attendance.new(user: current_user, event: @event)
      @attendance.save if @attendance.valid?
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @att = Attendance.where('event_id = ?', @event.id)
  end

  def index 
    @events = Event.all
  end

  private 

  def params_event
    params.require(:event).permit(:name, :description, :date)
  end
end
