require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end

  test "should redirect when logged out" do
    get root_path
    assert_redirected_to new_user_session_path
  end

  test "should open index when logged in" do
    sign_in @user

    get root_path
    assert_response :success
  end

end
