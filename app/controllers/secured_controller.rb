require 'json_web_token'
require 'byebug' if Rails.env.development?

class SecuredController < ApplicationController

  def current_user
    AuthorizationService.new(request.headers).current_user
  end
  
  private

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end