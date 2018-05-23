class PagesController < ApplicationController
  def about
    @title = 'About Us'
    @content = 'This is the about page'
  end

  def index
    @title = 'TravelMateBlog'
  end
end