require 'test_helper'

class MessageControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get conversation_messages_path(conversations(:test_conversation))
    if is_logged_in?
      assert_response :success
    else
      assert_response :found
    end
  end
end
