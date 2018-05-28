class ApplicationController < ActionController::Base
  # CSRF
  protect_from_forgery with: :null_session
end