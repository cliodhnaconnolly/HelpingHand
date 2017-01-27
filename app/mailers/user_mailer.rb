class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_passwords.subject
  #
  def forgot_password(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end
end
