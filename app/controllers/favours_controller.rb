class FavoursController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @favour = Favour.find(params[:id])
    @comment = current_user.comments.build if logged_in?
    @comments = @favour.comments.paginate(page: params[:page])
  end

  def new
    @favour = Favour.new
  end

  def create
    respond_to do |format|
      format.html {
        # Save favours
        @favour = current_user.favours.build(favour_params)

        @favour.deadline = deadline_options_to_time(params[:deadline_option])
        if params[:address] == ""
          puts 'HEYYYY'
          @favour.address = ''
        end

        if params[:use_current_location] == 'true'
          @favour.latitude = params[:lat]
          @favour.longitude = params[:long]
          #@favour.address = params[:address]
        else
          @favour.use_location = false
          #@favour.address = params[:address]
        end

        if @favour.save
          flash[:success] = 'Favour has been saved!'
          redirect_to @favour
        else
          render 'new'
        end
      }
    end

  end

  def index
    if(current_user.lat.nil?)
      @favours = Favour.all
    else
      @favours = Favour.near([current_user.lat, current_user.long], 50)
      @favours = @favours + Favour.where(longitude: nil).reverse_order
    end

    @favours = @favours.paginate(page: params[:page])
    @favours = @favours.find_all { |favour| favour.deadline.nil? || !favour.deadline.past?}
  end

  def nearby
    if params[:search].present?
      @favours = Favour.near([current_user.lat, current_user.long], 50)
    else
      @favours = Favour.all
    end
  end

  def destroy
    @favour.destroy
    flash[:success] = 'Favour deleted'
    redirect_to root_url
  end

  private
    def favour_params
      params.require(:favour).permit(:title, :description, :deadline_option, :lat, :long, :address, :use_current_location)
    end

    def correct_user
      @favour = current_user.favours.find_by(id: params[:id])
      redirect_to root_url if @favour.nil?
    end

    def deadline_options_to_time(deadline_option)
      case deadline_option.to_f
        when 1
          Time.current + 5.minutes
        when 2
          Time.now.end_of_hour
        when 3
          Time.current + 3.hours
        when 4
          Time.now.end_of_day
        when 5
          Time.current + 100.years
        else 0
      end
    end

end
