class App
  def call(env)
    headers = {
      'Content-Type' => 'text/html',
    }

    if env['REQUEST_PATH'].end_with?('.css')
      response = File.read 'public/style.css'
    else
      response = File.read 'views/index.html'
    end

    [200, headers, [response]]
  end
end
