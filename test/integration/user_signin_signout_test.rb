require 'test_helper'

class UserSigninSignoutTest < ActionDispatch::IntegrationTest
  test "Default listing page will be shown and in navigation bar login button will be shown" do
    get "/"
    assert_response :success
    assert_match "Email", response.body
    assert_match "Password", response.body
    assert_match "Login", response.body
    assert_match "Sign Up", response.body
  end

  test "After log out listing page will be shown and in navigation bar login button will be shown" do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    delete "/users/sign_out"
    follow_redirect!
    assert_match "Email", response.body
    assert_match "Password", response.body
    assert_match "Login", response.body
    assert_match "Sign Up", response.body
  end
end
