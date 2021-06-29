class StaticsController < ApplicationController
  def home
    render json: { status: "Im home"}
  end
end