
# This file is used by Rack-based servers to start the application.

require 'rack'
require_relative './app'

# Reload after every change
use Rack::Reloader, 0

# Serve Static files in the public folder directory
use Rack::Static, urls: ['/public', '/favicon.ico']

run App.new
