class StaticPagesController < ApplicationController

  def home
    @favour = current_user.favours.build if logged_in?
    if(current_user.lat.nil?)
      puts 'has no location'
      @favours = Favour.all
    else
      puts 'has location'
      @favours = Favour.near([current_user.lat, current_user.long], 50)
      @favours = @favours + Favour.where(longitude: nil).reverse_order
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
