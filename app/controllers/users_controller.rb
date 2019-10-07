class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params_user)
    if @user.valid?
      @user.save 
      redirect_to show_url
    else
      flash[:info] = 'Invalid username/email'
      render 'new'
    end
  end

  def show
  end

  private 

    def params_user
      params.require(:user).permit(:name, :email)
    end
end
