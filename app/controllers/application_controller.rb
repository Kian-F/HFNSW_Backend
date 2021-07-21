class ApplicationController < ActionController::Base
  config.load_defaults 6.0 and config.autoloader = :classic
  include Knock::Authenticable
  skip_before_action :verify_authenticity_token
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end
