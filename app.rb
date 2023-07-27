require 'erb'
require_relative './config/routers'

class App
  def call(env)
    headers = {
      'Content-Type' => 'text/html',
    }

    # title = get_title(env) || 'Ruby on Rails Tutorial'
    # erb = ERB.new(html_template)
  
    # response =  erb.result(binding) # File.read 'views/index.html'

    response = router.build_response(env)

    [200, headers, [response]]
  end

  private

  def html_template
    File.read 'views/index.html.erb'
  end

  def get_title(env)
    query = env['QUERY_STRING'] # "title=ruby"
    values = query.split('=')   # ["title", "ruby"]
    values[1]                   # ruby
  end

  def router
    Router.instance    
  end
end
