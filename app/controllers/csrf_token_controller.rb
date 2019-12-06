class CsrfTokenController < ApplicationController
  def index
    set_response_csrf_cookie
    head :ok
  end
end