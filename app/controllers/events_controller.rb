# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @event = Event.new
    @event.creator = current_user
  end

  def create
    @event = Event.new(params_event)
    @event.creator = current_user
    
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
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  private

  def params_event
    params.require(:event).permit(:name, :description, :date)
  end
end
