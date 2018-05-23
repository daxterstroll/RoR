class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    @title = 'About Us'
  end
end