class UsersController < ApplicationController

  before_action :authenticate_user,except: [:create]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show 
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
