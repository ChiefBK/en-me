class TemporaryPasswordController < ApplicationController
  include Passwords

  def create
    to_email = params[:to_email]

    user = User.find_by(email: to_email)

    if user.nil?
      head :not_found
      return
    end

    temp_pass = register_temporary_password(user, 5.minutes)
    SendTemporaryPassJob.perform_later(to_email, temp_pass)
    head :ok
  end
end