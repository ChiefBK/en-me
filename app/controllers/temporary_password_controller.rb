class TemporaryPasswordController < ApplicationController
  def create
    to_email = params[:to_email]

    SendTemporaryPassJob.perform_later(to_email, 666777)

    head :ok
  end
end