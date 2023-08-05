require 'singleton'
require_relative 'controllers/articles_controller'

class Router
  include Singleton

  class << self
    def draw(&blk)
      Router.instance.instance_exec(&blk)
    end
  end
  def initialize
    @routes = {}
  end

  def get(path, &blk)
    if blk
      @routes[path] = blk
    else
      if path.include? '/'
        @routes['/' + path] = ->(env) {
          controller_name, action_name = path.split('/')
          controller_klass = constantize(controller_name)
          controller = controller_klass.new(env)
          controller.send(action_name.to_sym)
          controller.render("views/#{controller_name}/#{action_name}.html.erb")
        }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end

  private

  def constantize(name)
    controller_klass_name = name.capitalize + 'Controller'
    Object.const_get(controller_klass_name)
  end
end
