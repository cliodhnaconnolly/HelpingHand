require 'test_helper'

class ConversationControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cliodhna)
  end

  test 'should get index' do
    get conversations_path
    if is_logged_in?
      assert_response :success
    else
      assert_response :found
    end
  end

  test 'should get inbox' do
    get inbox_path
    if is_logged_in?
      assert_response :success
    else
      assert_response :found
    end
  end
end
