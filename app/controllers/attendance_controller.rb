# frozen_string_literal: true

class AttendanceController < ApplicationController
  def new; end

  def create
    @user = current_user
    @event = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)

    if @attendance.valid?
      @attendance.save
      flash[:alert] = 'Great! You have joined this event'
    else
      flash[:alert] = 'You have already joined this event'
    end
    redirect_to @event
  end
end
