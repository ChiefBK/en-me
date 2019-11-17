class UsersController < ApplicationController
  def create
    provided_first_name = params[:first_name]
    provided_last_name = params[:last_name]
    provided_display_name = params[:display_name]
    provided_email = params[:email]
    provided_phone_number = params[:phone_number]
    user_phone = nil

    errors = ActiveModel::Errors.new(self)

    user = User.new(first_name: provided_first_name, last_name: provided_last_name, display_name: provided_display_name, email: provided_email)

    unless provided_phone_number.nil?
      user_phone = Phone.new(phone_number: provided_phone_number, is_primary: true)

      user.phones << user_phone
      user_phone.user = user

      user_phone.validate
      errors.merge!(user_phone.errors)
    end

    user.validate
    errors.merge!(user.errors)

    unless errors.empty?
      render json: errors, status: :unprocessable_entity
      return
    end

    unless user_phone.nil?
      user_phone.save
    end

    user.save

    head :created
  end
end