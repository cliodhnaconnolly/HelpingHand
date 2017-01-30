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
    @favour = current_user.favours.build(favour_params)
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

  def destroy
    @favour.destroy
    flash[:success] = 'Favour deleted'
    redirect_to root_url
  end

  private
    def favour_params
      params.require(:favour).permit(:title, :description, :deadline)
    end

    def correct_user
      @favour = current_user.favours.find_by(id: params[:id])
      redirect_to root_url if @favour.nil?
    end
end
