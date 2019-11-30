class SendTemporaryPassJob < ApplicationJob
  queue_as :default

  def perform(to_email, temp_pass)
    email_client = AWS::Email::Client.new
    email_client.send_email(to_email, "Temp Pass", "Your temporary password is #{temp_pass}")
  end
end