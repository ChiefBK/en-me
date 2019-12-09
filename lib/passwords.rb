module Passwords
  def self.register_temporary_password(user, duration = 1.minute)
    temporary_password = self.generate_password
    temp_pass = TemporaryPassword.create(user: user, password: temporary_password)

    # TODO - what to do with temporary passwords if multiple are generated for same user
    DeleteTemporaryPassJob.set(wait: duration).perform_later(temp_pass.id)
    temp_pass.password
  end

  def self.check_temporary_password?(user, password_to_check)
    temp_pass = TemporaryPassword.temporary_password_for_user(user)
    temp_pass != nil && password_to_check != nil && temp_pass.password == password_to_check
  end

  def self.generate_password
    SecureRandom.random_number.to_s[2..7]
  end
end