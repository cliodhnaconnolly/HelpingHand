require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:cliodhna)
    @comment = @user.comments.build(content: "Lorem ipsum")
  end

  # test "should be valid" do
  #   assert @comment.valid?
  # end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "order should be most recent first" do
    assert_equal comments(:tau_manifesto), Comment.first
  end
end
