require_relative '../router'

Router.draw do
  get('/') do |env|
    puts "path: #{env['REQUEST_PATH']}"
    'Home page'
  end

  get('/posts') { 'Posts/Articles page '}
  get('/posts/1') { 'First post/article page '}
end
