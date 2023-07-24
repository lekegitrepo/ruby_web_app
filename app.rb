require 'erb'
require_relative './router'

class App
  attr_reader :router

  def initialize
    @router = Router.new
    
    router.get('/') { 'Home page '}
    router.get('/posts') { 'Posts/Articles page '}
    router.get('/posts/1') { 'First post/article page '}
  end

  def call(env)
    headers = {
      'Content-Type' => 'text/html',
    }

    # title = get_title(env) || 'Ruby on Rails Tutorial'
    # erb = ERB.new(html_template)
  
    # response =  erb.result(binding) # File.read 'views/index.html'

    response = router.build_response(env['REQUEST_PATH'])

    [200, headers, [response]]
  end

  def html_template
    File.read 'views/index.html.erb'
  end

  def get_title(env)
    query = env['QUERY_STRING'] # "title=ruby"
    values = query.split('=')   # ["title", "ruby"]
    values[1]                   # ruby
  end
end
