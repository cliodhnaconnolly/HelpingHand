require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message_notification" do
    mail = MessageMailer.message_notification
    assert_equal "Message notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
