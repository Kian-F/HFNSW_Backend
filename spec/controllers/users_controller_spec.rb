require 'rails_helper'
RSpec.describe UsersController do
  
  describe "GET index" do
    let!(:users) { FactoryBot.create_list(:user, 3) }
    it "returns a list of users" do
      @users = Users.all
      byebug
    end
  end
end
