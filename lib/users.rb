module Users
  def self.create_user(first_name, last_name, display_name, email, phone_number)
    user = User.new(first_name: first_name, last_name: last_name, display_name: display_name, email: email)
    user_phone = nil

    unless phone_number.nil?
      user_phone = user.phones.new(phone_number: phone_number, is_primary: true)
    end

    user.save

    if !user_phone.nil? && user.valid?
      user_phone.save
    end

    [ user, user_phone ]
  end
end