class UsersController < ApplicationController
  def create
    errors = ActiveModel::Errors.new(self)

    user, user_phone = Users.create_user(params[:first_name], params[:last_name], params[:display_name], params[:email], params[:phone_number])

    errors.merge!(user.errors)

    unless user_phone.nil?
      errors.merge!(user_phone.errors)
    end

    unless user.valid?
      render json: errors, status: :unprocessable_entity
      return
    end

    head :created
  end
end