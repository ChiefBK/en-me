class SessionsController < ApplicationController
  def create
    user_email = params[:email]
    user_phone_number = params[:phone_number]
    user = nil

    if !user_email.nil?
      user = User.find_by(email: user_email)
    elsif !user_phone_number.nil?
      user = User.joins(:phones).find_by(phones: { phone_number: user_phone_number})
    end

    if user.nil?
      # handle error - can not find user
    end

    session[:current_user_id] = user[:id]
  end
end