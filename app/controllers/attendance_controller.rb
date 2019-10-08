class AttendanceController < ApplicationController
  def new 
  end 

  def create
    @user = current_user
    @attendance = Attendance.new(user: @user, event_id: params[:id].to_i)
  end
end
