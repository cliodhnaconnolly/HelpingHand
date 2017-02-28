class StaticPagesController < ApplicationController

  def home
    @favour = current_user.favours.build if logged_in?
    if(current_user.latitude.nil?)
      @favours = Favour.all
    else
      @favours = Favour.near([current_user.latitude, current_user.longitude], 50)
      @favours = @favours + Favour.where(longitude: nil)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
