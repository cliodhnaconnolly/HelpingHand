require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  def setup
    @conversation = conversations(:test_conversation)
  end

  test 'associated messages should be destroyed' do
    @conversation.save
    @conversation.destroy
    # Fixtures already contains one message in this conversation
    assert_equal 0, Message.count
  end
end
