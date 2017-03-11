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
      @favour = Favour.find(params[:favour_id])

      # If comment not by creator only update creator
      if @favour.user_id != current_user.id
        @favour.send_comment_notification_email
      else  # If creator comments update all commentors
        @comments = @favour.comments
        to_email_ary = Array.new

        @comments.each do |comment|
          commenter = User.find_by(comment.user_id)
          if !commenter.nil? && to_email_ary.find_index(commenter.email).nil?
            to_email_ary.push(commenter.email)
          end
        end

        to_email_ary.each do |email|
          @favour.send_creator_comment_notification_email(email)
        end

      end
      redirect_to @favour
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
