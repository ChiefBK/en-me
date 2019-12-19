class PasswordMailer < ApplicationMailer
  default from: 'passwords@ianpierce.org'

  def send_temp_pass
    to_email = params[:email]
    @temp_pass = params[:password]
    puts "sending temporary password to #{to_email} with pass #{@temp_pass}"
    mail(:to=>to_email, :subject=>"Your Temporary Password")
  end
end
