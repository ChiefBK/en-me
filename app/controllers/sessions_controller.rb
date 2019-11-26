class SessionsController < ApplicationController
  def create
    provided_email = params[:email]
    provided_phone_number = params[:phone_number]
    user = nil

    if !provided_email.nil?
      user = User.find_by(email: provided_email)
    elsif !provided_phone_number.nil?
      user = User.joins(:phones).find_by(phones: { phone_number: provided_phone_number})
    end

    if user.nil?
      # handle error - can not find user
      return
    end

    # if authentication is successful
    payload = { user_id: user.id, creation_datetime: DateTime.now }
    token = JWT.encode payload, ENV['SESSION_KEY_SECRET'], 'HS256'

    cookies['JWT-TOKEN'] = token

    head :created
  end
end