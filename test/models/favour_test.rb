require 'test_helper'

class FavourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @favour = Favour.new(creator: "test@example.com", title: "I need a test!",
        description: "If anyone could help with my test that'd be great",
                         deadline: DateTime.new(2017, 1,2,3,4,5),  latitude: "53.3498° N",
                         longitude: "6.2603° W")
  end

  test "should be valid" do
    assert @favour.valid?
  end
end
