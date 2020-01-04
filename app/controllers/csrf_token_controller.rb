class CsrfTokenController < ApplicationController
  skip_before_action :verify_csrf_token

  def index
    set_response_csrf_cookie
    head :ok
  end
end