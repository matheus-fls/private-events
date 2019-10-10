class AttendanceController < ApplicationController
  def new 
  end 

  def create
    @user = current_user
    @attendance = Attendance.new(user: @user, event_id: params[:id])
    if @attendance.valid?
      @attendance.save
    end
    redirect_to root_path
  end
end
