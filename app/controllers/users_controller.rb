class UsersController < ApplicationController
  def new
  end

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
    @user = User.find(current_user)
  end

  private 

    def params_user
      params.require(:user).permit(:name, :email)
    end
end
