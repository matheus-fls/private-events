require "./app/controllers/users_controller"

RSpec.describe UsersController do 
  describe "Create new user" do 
    it "Create a blank user" do 
      app = ApplicationController.new
      expect(true).to true
    end
  end
end
