class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    if logged_in?
      @messages = @conversation.messages
      if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
      end
      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end
      if @messages.last
        if @messages.last.user_id != current_user.id
          @messages.last.read = true;
        end
      end

      @message = @conversation.messages.new
    else
      store_location
      flash[:info] = 'Please log in to view your messages!'
      redirect_to login_path
    end
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    puts 'MSG: ' + Conversation.find(@message.conversation_id).receiver_id.to_s
    if @message.save
      @message.send_message_notification_email(@conversation, current_user)
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end