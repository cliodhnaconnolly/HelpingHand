require 'test_helper'

class FavourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:cliodhna)
    @favour = @user.favours.build(creator: "test@example.com", title: "I need a test!",
        description: "If anyone could help with my test that'd be great",
                         deadline: DateTime.new(2017, 1,2,3,4,5),  latitude: "53.3498° N",
                         longitude: "6.2603° W", user_id: @user.id)
  end

  test 'should be valid' do
    assert @favour.valid?
  end

  test 'user id should be present' do
    @favour.user_id = nil
    assert_not @favour.valid?
  end
end
