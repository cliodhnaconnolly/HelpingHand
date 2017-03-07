require 'test_helper'

class FavourMailerTest < ActionMailer::TestCase
  test "comment_notification" do
    favour = favours(:one)
    user = users(:cliodhna)
    mail = FavourMailer.comment_notification(favour)
    #assert_equal "New comment on favour", mail.subject
    #assert_equal [user.email], mail.to
    #assert_equal ["from@helping-hand-ucd.herokuapp.com"], mail.from
  end

end
