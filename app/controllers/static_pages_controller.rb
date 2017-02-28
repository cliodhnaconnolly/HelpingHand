class StaticPagesController < ApplicationController
  def home
    @favour = current_user.favours.build(favour_params)
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

  private
    def favour_params
      params.permit(:title, :description, :deadline_option, :lat, :long, :address, :use_current_location)
    end
end
