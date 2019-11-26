class CsrfTokenController < ApplicationController
  def index
    csrf_token = SecureRandom.hex 32

    cookies["CSRF-TOKEN"] = csrf_token

    head :ok
  end
end