class StaticPagesController < ApplicationController

  def home
    @favour = current_user.favours.build if logged_in?
    if current_user.lat.blank? || current_user.lat.nil?
      @favours = Favour.all
    else
      @favours = Favour.near([current_user.lat, current_user.long], 50)
      @favours = @favours + Favour.where(longitude: nil).reverse_order
      @favours = @favours.find_all { |favour| favour.deadline.blank? || !favour.deadline.past?}
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
