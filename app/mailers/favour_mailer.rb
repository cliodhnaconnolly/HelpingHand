class FavourMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.favour_mailer.comment_notification.subject
  #
  def comment_notification(favour)
    @favour = favour
    @user = User.find(favour.user_id)
    mail to: @user.email, subject: 'New comment on favour'
  end

end
