class TemporaryPasswordController < ApplicationController
  def create
    to_email = params[:to_email]

    user = User.find_by(email: to_email)

    if user.nil?
      head :not_found
      return
    end

    temp_pass = Passwords.register_temporary_password(user, 10.minutes)
    PasswordMailer.with(email: to_email, password: temp_pass).send_temp_pass.deliver_later
    head :created
  end
end