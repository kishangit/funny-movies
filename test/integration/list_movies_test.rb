require 'test_helper'

class ListMoviesTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "get movie listing page if user logged in" do
    get "/movies"
    assert_response :success
    assert_match "Share a movie", response.body
    assert_match "Log out", response.body
  end

  test "get movie listing page even if user logged out" do
    delete "/users/sign_out"
    get "/movies"
    assert_response :success
    assert_match "Email", response.body
    assert_match "Password", response.body
    assert_match "Login", response.body
  end
end
