class TemporaryPasswordController < ApplicationController
  def create
    to_email = params[:to_email]

    user = User.find_by(email: to_email)

    if user.nil?
      head :not_found
      return
    end

    temp_pass = Passwords.register_temporary_password(user, 10.minutes)
    temp_pass.email_temporary_password

    head :created
  end
end