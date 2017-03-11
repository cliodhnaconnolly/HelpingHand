# Preview all emails at http://localhost:3000/rails/mailers/favour_mailer
class FavourMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/favour_mailer/comment_notification
  def comment_notification
    favour = Favour.first
    FavourMailer.comment_notification(favour)
  end

  # Preview this email at http://localhost:3000/rails/mailers/favour_mailer/creator_comment_notification
  def creator_comment_notification
    favour = Favour.first
    user = User.last

    FavourMailer.creator_comment_notification(favour, user.email)
  end

end
