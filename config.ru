
# This file is used by Rack-based servers to start the application.

require 'rack'
require_relative './app'

run App.new
