class StaticPagesController < ApplicationController
  def home
    @favour = current_user.favours.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
