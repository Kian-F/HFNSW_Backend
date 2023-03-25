class StaticsController < ApplicationController
  def home
    render json: { status: "This is home"}
  end
end