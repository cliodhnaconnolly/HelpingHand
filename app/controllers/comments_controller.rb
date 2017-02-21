class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    temp = params[:favour_id]
    @comment = current_user.comments.build(comment_params)
    @comment.favour_id = temp
    puts "PLZ" + @comment.favour_id.to_s
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to Favour.find(params[:favour_id])
    else
      redirect_to(:back)
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
      params.require(:comment).permit(:content)
    end
end
