class CsrfTokenController < ApplicationController
  def index
    csrf_token = SecureRandom.hex 128

    cookies["CSRF-TOKEN"] = csrf_token

    head :ok
  end
end