ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActionDispatch::IntegrationTest
  fixtures :all

  # Returns true if a user is logged in
  def is_logged_in?
    !session[:user_id].nil?
  end
end