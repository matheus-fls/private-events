require 'rails_helper'
require "./app/controllers/users_controller"

RSpec.describe UsersController do 
  describe "Create new user" do 
    it "Create a nil user" do 
      @user = User.new()
      expect(@user).to_not be_valid
    end

    it "Create a blank user" do 
      @user = User.new(name:'', email:'')
      expect(@user).to_not be_valid
    end

    it "Create a valid user" do 
      @user = User.new(name:'Anthony', email:'antman@gmail.com')
      expect(@user).to be_valid
    end

    it "Create a user with invalid email" do 
      @user = User.new(name:'Foobar', email:'foobar@gmail')
      expect(@user).to_not be_valid
    end

  end
end
