require 'test_helper'

class FavoursControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favours_new_url
    assert_response :success
  end

end
