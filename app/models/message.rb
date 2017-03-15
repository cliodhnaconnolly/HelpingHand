class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    created_at.strftime("%d/%m/%y at %l:%M %p")
  end

  def send_message_notification_email(conversation, user)
    MessageMailer.message_notification(conversation, user).deliver_now
  end
end
