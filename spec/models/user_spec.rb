require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = User.new(first_name:"Mahyar", last_name:"Kianfar", mobile:"0434901112") }
  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end


  it "should return users's first name" do
    expect(@user.first_name).to eq("Mahyar")
  end

  it "should return error if first name is not present" do
    
  end

  it "checks email address is already taken" do
    # user = User.create(email: )
  end

end
