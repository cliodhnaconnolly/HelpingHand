require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cliodhna)
  end

  test 'should get new' do
    get signup_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_path(@user)
    if is_logged_in?
      assert_response :success
    else
      assert_response :found
    end
  end

  test 'should get index' do
    get users_path
    if is_logged_in?
      assert_response :success
    else
      assert_response :found
    end
  end

  test 'should get show' do
    get user_path(@user)
    assert_response :success
  end

  test 'should post store location' do
    post store_location_path(lat: Faker::Address.latitude, lng: Faker::Address.longitude)
    assert_response :success
  end

  test 'should get show my favours' do
    get my_favours_path(@user)
    assert_response :success
  end


end
