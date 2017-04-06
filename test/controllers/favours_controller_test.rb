require 'test_helper'

class FavoursControllerTest < ActionDispatch::IntegrationTest
  def setup
    @favour = favours(:one)
  end

  test 'should get new' do
    get favours_new_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_favour_path(@favour)
    assert_response :success
  end

  test 'should get index' do
    get favours_path
    assert_response :success
  end

  test 'should get show' do
    get favour_path(@favour)
  end

end
