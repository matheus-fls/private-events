class AttendanceController < ApplicationController
  def new 
  end 

  def create
    @user = current_user
    @event = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)
    
    unless Attendance.where(user: @user, event: @event).exists?
      @attendance.save
      redirect_to @event
      flash.notice = "Great! You have joined this event"
    else
      flash.now.alert = 'You have already joined this event'
    end
  end
end
