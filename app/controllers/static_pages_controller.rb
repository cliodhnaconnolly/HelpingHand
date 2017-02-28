class StaticPagesController < ApplicationController

  def home
    @favour = current_user.favours.build if logged_in?
    if(current_user.lat.nil?)
      @favours = Favour.all
    else
      @favours = Favour.near([current_user.lat, current_user.long], 50)
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
