require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "User signup page will be shown with Email and Password text fields" do
    get "/users/sign_up"
    assert_response :success
    assert_match "Email", response.body
    assert_match "Password", response.body
    assert_match "Sign up", response.body
  end
end
