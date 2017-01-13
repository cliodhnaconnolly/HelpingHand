class FavoursController < ApplicationController
  def show
    @favour = Favour.find(params[:id])
  end

  def new
    @favour = Favour.new
  end

  def create
    @favour = Favour.new(favour_params)
    if @favour.save
      flash[:success] = 'Favour has been saved!'
      redirect_to @favour
    else
      render 'new'
    end
  end

  def index
    @favours = Favour.all
  end

  private
    def favour_params
      params.require(:favour).permit(:title, :description, :deadline, :creator)
    end
end
