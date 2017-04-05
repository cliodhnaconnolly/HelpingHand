require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message_notification" do
    mail = MessageMailer.message_notification(conversations(:test_conversation), users(:connolly))
    assert_equal "You've received a new message", mail.subject
    assert_equal ["cliodhna@me.com"], mail.to
    assert_equal ["from@helping-hand-ucd.herokuapp.com"], mail.from
    assert_not_empty mail.body.encoded
  end

end
