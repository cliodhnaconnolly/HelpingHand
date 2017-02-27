class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action do
    @favour = Favour.find(params[:favour_id])
    puts "GOT IT" + @favour.title.to_s
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    puts 'hey'
  end

  def create
    #temp = params[:favour_id]
    #@favour = Favour.find(params[:favour_id])
    @comment = @favour.comments.new(comment_params)
    #@comment.favour = Favour.find(params[:favour_id])
    puts "PLZ " + @comment.favour_id.to_s
    puts "CONTENT " + @comment.content.to_s
    puts "USER ID " + @comment.user_id.to_s
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to Favour.find(params[:favour_id])
    else
      redirect_to favour_path(@favour)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to root_url
  end

  def index
    @comments = Comment.order('created_at DESC')
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end
end
