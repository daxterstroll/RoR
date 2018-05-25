class ApplicationController < ActionController::Base
  # CSRF
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  def index
    @title = 'About Us'
  end
end