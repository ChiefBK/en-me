class DeleteTemporaryPassJob < ApplicationJob
  include Passwords

  queue_as :default

  def perform(user)
    Passwords.delete_temporary_password(user)
  end
end