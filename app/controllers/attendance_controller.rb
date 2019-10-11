# frozen_string_literal: true

class AttendanceController < ApplicationController
  def new; end

  def create
    @user = current_user
    @event = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)

    if Attendance.where(user: @user, event: @event).exists?
      flash[:alert] = 'You have already joined this event'
    else
      @attendance.save
      flash[:alert] = 'Great! You have joined this event'
    end
    redirect_to @event
  end
end
