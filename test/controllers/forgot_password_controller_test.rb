require 'test_helper'

class ForgotPasswordControllerTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:cliodhna)
  end

  test 'forgot passwords' do
    get new_forgot_password_path
    assert_template 'forgot_passwords/new'
    # Invalid email
    post forgot_passwords_path, params: { forgot_password: { email: '' } }
    assert_not flash.empty?
    assert_template 'forgot_passwords/new'
    # Valid email
    post forgot_passwords_path,
         params: { forgot_password: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
    # Forgot password form
    user = assigns(:user)
    # Valid password & confirmation
    patch forgot_password_path(user.reset_token),
          params: { email: user.email,
                    user: { password:              'foobaz',
                            password_confirmation: 'foobaz' } }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end
end
