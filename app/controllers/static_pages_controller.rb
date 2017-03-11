class StaticPagesController < ApplicationController

  def home
    @favour = current_user.favours.build if logged_in?

    if(!logged_in? || current_user.lat.nil?)
      @favours = Favour.where.not(:deadline.nil?)
    else
      @favours = Favour.near([current_user.lat, current_user.long], 50)
      @favours = @favours + Favour.where(longitude: nil).reverse_order
    end

    #@favours = @favours.paginate(page: params[:page])
    @favours = @favours.find_all { |favour| !favour.deadline.past?}
  end

  def help
  end

  def about
  end

  def contact
  end

end
