class AccessManagementController < ApplicationController
  before_action :verify_csrf_token

  private

  def verify_csrf_token
    cookie_csrf_token = cookies['X-CSRF-Token']
    request_header_csrf_token = headers['X-CSRF-Token']

    if cookie_csrf_token.nil? || request_header_csrf_token.nil? || cookie_csrf_token != request_header_csrf_token
      head :unauthorized
    end
  end
end