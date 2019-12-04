module JsonWebToken
  def self.create_token(user)
    payload = { user_id: user.id, creation_datetime: DateTime.now }
    token = JWT.encode payload, ENV['SESSION_KEY_SECRET'], 'HS256'
  end
end