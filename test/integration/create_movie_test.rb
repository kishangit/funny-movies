require 'test_helper'

class CreateMovieTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "get new movie form and create movie" do
    get "/movies/new"
    assert_response :success
    assert_difference "Movie.count", 1 do
      post movies_url, params: { movie_url: 'https://www.youtube.com/watch?v=60ItHLz5WEA' }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Movie succesfully added", response.body
  end

  test "get new movie form and reject invalid movie submission" do
    get "/movies/new"
    assert_response :success
    assert_no_difference "Movie.count" do
      post movies_url, params: { movie_url: 'https://www.youtube.com' }
    end
    assert_match "Please add valid url", response.body
    assert_select "div.alert-danger"
  end

end
