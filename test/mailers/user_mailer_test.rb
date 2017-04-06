require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'forgot_password' do
    user = users(:cliodhna)
    user.reset_token = User.new_token
    mail = UserMailer.forgot_password(user)
    assert_equal "Password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["from@helping-hand-ucd.herokuapp.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

end
