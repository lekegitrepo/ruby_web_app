require_relative 'application_controller'

class ArticlesController < ApplicationController  
  def index
    @title = 'All Articles'
    @old_title = 'All Old Articles'
  end
end
