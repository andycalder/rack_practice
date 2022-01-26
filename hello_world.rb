class HelloWorld

  def call(env)
    pp env
    valid_credentials?(env['HTTP_AUTHORIZATION']) ? success : unauthorized
  end

  private

  def valid_credentials?(auth_header)
    auth_header && auth_header == 'Basic p@ssword'
  end

  def success
    [200, { 'Content-Type' => 'text/plain' }, ['Hello world!']]
  end

  def unauthorized
    [401, { 'Content-Type' => 'text/plain' }, ['Unauthorized']]
  end

end
