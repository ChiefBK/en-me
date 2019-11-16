class UsersController < ApplicationController
  def create
    provided_first_name = params[:first_name]
    provided_last_name = params[:last_name]
    provided_display_name = params[:display_name]
    provided_email = params[:email]
    provided_phone_number = params[:phone_number]
    user_phone = nil
    user_email = nil

    unless provided_phone_number.nil?
      unless provided_phone_number.size == 10
        # send error - invalid phone number
      end

      user_phone = Phone.new(phone_number: provided_phone_number, is_primary: true)
    end

    unless provided_email.nil?
      # send error - user_email not valid

      user_email = provided_email
    end

    user = User.new(first_name: provided_first_name, last_name: provided_last_name, display_name: provided_display_name, email: user_email)

    unless user_phone.nil?
      user.phones << user_phone
      user_phone.user = user
      user_phone.save
    end

    user.save

    head :created
  end
end