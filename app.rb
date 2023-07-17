class App
  def call(env)
    headers = {
      'Content-Type' => 'text/html',
    }

    response = File.read 'views/index.html'

    [200, headers, [response]]
  end
end
