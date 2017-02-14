class FavoursController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @favour = Favour.find(params[:id])
  end

  def new
    @favour = Favour.new
  end

  def create
    puts deadline_options_to_time(params[:deadline_option]).to_s
    puts params[:use_current_location]
    puts current_user.name.to_s

    deadline_options_to_time(params[:deadline_option])

    if params[:use_current_location] == 'true'
      puts 'hello again'
      puts '<' + params[:lat].to_s + '>'
      puts params[:lng].to_s

      if params[:lat] == ''
        puts 'empty string lads'
      end

    end

    #@favour = current_user.favours.build(favour_params)
    #if @favour.save
    #  flash[:success] = 'Favour has been saved!'
    #  redirect_to @favour
    #else
    #  render 'new'
    #end
  end

  def index
    @favours = Favour.all
  end

  def near
    @favours = Favour.all
  end

  def destroy
    @favour.destroy
    flash[:success] = 'Favour deleted'
    redirect_to root_url
  end

  private
    def favour_params
      params.require(:favour).permit(:title, :description, :deadline_option)
    end

    def correct_user
      @favour = current_user.favours.find_by(id: params[:id])
      redirect_to root_url if @favour.nil?
    end

    def deadline_options_to_time(deadline_option)
      puts "DEADLINE OPTION GIVEN IS" + deadline_option

      case deadline_option.to_f
        when 1
          puts "hello"
          Time.current + 5.minutes
        when 2
          Time.end_of_hour
        when 3
          Time.current + 3.hours
        when 4
          Time.end_of_day
        else 0
      end
    end

end
