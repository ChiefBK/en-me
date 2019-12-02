module Passwords
  def register_temporary_password(user, duration = 1.minute)
    temporary_password = generate_password
    password_tracker.user_id_to_password[user.id] = temporary_password

    # TODO - delete jobs that already exist for given user
    DeleteTemporaryPassJob.set(wait: duration).perform_later(user)
    temporary_password
    # puts "temp pass"
  end

  def delete_temporary_password(user)
    password_tracker.user_id_to_password.delete(user.id)
  end

  private

  class Tracker
    attr_reader :user_id_to_password

    def initialize
      @user_id_to_password = {}
    end

    def self.instance
      @tracker ||= Tracker.new
    end
  end

  def password_tracker
    Tracker.instance
  end

  def generate_password(length = 6)
    random_hex_string = SecureRandom.hex
    random_dec_string = Integer("0x#{random_hex_string}").to_s
    random_dec_string[0...length]
  end
end