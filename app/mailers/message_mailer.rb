class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_notification.subject
  #
  def message_notification(conversation)
    @conversation = conversation
    @user = User.find(conversation.receiver_id)
    @sender = User.find(conversation.sender_id)
    mail to: @user.email, subject: "You've received a new message"
  end
end
