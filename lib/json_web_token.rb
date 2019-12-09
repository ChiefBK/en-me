module JsonWebToken
  def set_jwt_cookie(user)
    cookies['JWT-TOKEN'] = create_token(user)
  end

  def set_request_jwt_cookie(user)
    request.cookies['JWT-TOKEN'] = create_token(user)
  end

  private

  def create_token(user)
    payload = { user_id: user.id, creation_datetime: DateTime.now }
    JWT.encode payload, ENV['SESSION_KEY_SECRET'], 'HS256'
  end
end