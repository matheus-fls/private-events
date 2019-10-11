# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user_aux = User.new(params_user)
    @user = User.find_by_email(@user_aux.email)
    if @user
      log_in @user.id
      redirect_to @user
    else
      flash[:info] = 'Invalid username/email'
      render 'new'
    end
  end

  def destroy
    if logged?
      log_out
      redirect_to login_path
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email)
  end
end
