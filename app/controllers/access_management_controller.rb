class AccessManagementController < ApplicationController
  before_action :verify_csrf_token, :verify_jwt_token

  private

  def verify_csrf_token
    cookie_csrf_token = cookies['CSRF-TOKEN']
    request_header_csrf_token = request.headers['CSRF-TOKEN']

    if cookie_csrf_token.nil? || request_header_csrf_token.nil? || cookie_csrf_token != request_header_csrf_token
      puts "CSRF token is nil"

      head :unauthorized
    end
  end

  def verify_jwt_token
    cookie_jwt_token = cookies['JWT-TOKEN']

    if cookie_jwt_token.nil?
      puts "JWT token is nil"

      head :unauthorized
    end

    begin
      params[:jwt_payload], params[:jwt_header] = JWT.decode(cookie_jwt_token, ENV['SESSION_KEY_SECRET'], true, { algorithm: 'HS256' })
      params[:current_user_id] = params[:jwt_payload][:user_id]
    rescue JWT::DecodeError
      puts "could not decode JWT token"
      head :unauthorized
    end
  end
end