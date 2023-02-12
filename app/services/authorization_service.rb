class AuthorizationService

  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  def current_user
    verify_token
    if Rails.env.development?
      return @current_user =  User.find_by(email: verify_token[0]["https://pursuit-api.com/email"])
    end

    return  @current_user =  User.find_by(email: verify_token[0]["https://pursuit-api.com/email"])
  end

  private

  def http_token
    if @headers['Authorization'].present?
      @headers['Authorization'].split(' ').last
    end
  end

  def verify_token
    JsonWebToken.verify(http_token)
  end
end