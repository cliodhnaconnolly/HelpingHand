require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = messages(:one)
  end

  test 'should be valid' do
    assert @message.valid?
  end

  test 'body should be present' do
    @message.body = '     '
    assert_not @message.valid?
  end

  test 'conversation id should be present' do
    @message.conversation_id = nil
    assert_not @message.valid?
  end

  test 'user id should be present' do
    @message.user_id = nil
    assert_not @message.valid?
  end

end
