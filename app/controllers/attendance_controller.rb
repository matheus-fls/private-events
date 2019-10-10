class AttendanceController < ApplicationController
  def new 
  end 

  def create
    @user = current_user
    @event = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)
    
    unless Attendance.where(user: @user, event: @event).exists?
      @attendance.save
      flash[:alert] = "Great! You have joined this event"
      redirect_to @event
    else
      flash[:alert] = 'You have already joined this event'
      redirect_to @event
    end
  end
end
