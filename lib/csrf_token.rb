module CSRFToken
  def set_matching_request_csrf
    csrf_token = SecureRandom.hex 32
    set_request_csrf_cookie(csrf_token)
    set_request_csrf_header(csrf_token)
  end

  def set_response_csrf_cookie
    cookies['CSRF-TOKEN'] = SecureRandom.hex 32
  end

  def set_request_csrf_cookie(val)
    request.cookies['CSRF-TOKEN'] = val
  end

  def set_request_csrf_header(val)
    request.headers['CSRF-TOKEN'] = val
  end
end