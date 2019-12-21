class PasswordMailer < ApplicationMailer
  default from: 'passwords@ianpierce.org'

  def send_temp_pass(to_email, password)
    @temp_pass = password
    mail(:to=>to_email, :subject=>"Your Temporary Password")
  end
end
