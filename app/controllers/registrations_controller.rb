class RegistrationsController < ApplicationController
  def create 
    user: User.cretae!(
      email: params['user']['email'],
      password: params['user']['password_digest'],
      password_confirmation: params['user']['password_confirmation']
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: created,
        user: user
      }
    else 
      render json: {
        status: 500,
        error: 'Couldn/'t create the user'
      }  
    end
  end

  def new
  end
end
