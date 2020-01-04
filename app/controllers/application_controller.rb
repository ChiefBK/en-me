class ApplicationController < ActionController::API
  include ActionController::Cookies, AWS::Email, JsonWebToken, CSRFToken
  before_action :verify_csrf_token

    rescue_from StandardError do |e|
    respond_with_error(:internal_server_error, "server error", e.message)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    respond_with_error(:not_found, "could not find record", e.message)
  end

  rescue_from Error::Responses::ResponseError do |e|
    respond_with_error(e.status, e.error, e.message)
  end

  def respond_with_error(_status, _error, _message)
    json = {error: _error, message: _message}.to_json
    render json: json, status: _status
  end

  def options
    options = {}

    if params[:include]
      options[:include] = params[:include]
    end

    options
  end

  private

  def verify_csrf_token
    cookie_csrf_token = cookies['CSRF-TOKEN']
    request_header_csrf_token = request.headers['CSRF-TOKEN']

    if cookie_csrf_token.nil? || request_header_csrf_token.nil? || cookie_csrf_token != request_header_csrf_token
      puts "CSRF token is nil"

      head :unauthorized
    end
  end
end
