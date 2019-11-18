class ApplicationController < ActionController::API
  include ActionController::Cookies

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

end
