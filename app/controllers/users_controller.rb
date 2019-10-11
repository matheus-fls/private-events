# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(params_user)
    if @user.valid?
      @user.save
      log_in @user.id
      redirect_to @user
    else
      flash[:info] = 'Invalid username/email'
      render 'new'
    end
  end

  def show
    if params[:id].to_i == current_user.id
      @user = current_user
      @events = Event.where('user_id = ?', @user.id)
      @eves = Attendance.where('user_id = ?', @user.id)
      @upcoming_events = Event.upcoming_events(@user.id)
      @prev_events = Event.past_events(@user.id)
    else
      redirect_to '/'
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email)
  end
end
