class SessionsController < ApplicationController
  def create
    provided_email = params[:email]
    provided_phone_number = params[:phone_number]
    provided_temporary_password = params[:temporary_password]

    user = nil

    if !provided_email.nil?
      user = User.find_by(email: provided_email)
    elsif !provided_phone_number.nil?
      user = User.find_by_phone_number(provided_phone_number)
    end

    if user.nil?
      head :not_found
      return
    end

    entered_correct_password = Passwords.check_temporary_password(user, provided_temporary_password)

    unless entered_correct_password
      head :unauthorized
      return
    end

    # if authentication is successful
    token = JsonWebToken.create_token(user)

    cookies['JWT-TOKEN'] = token

    head :created
  end
end