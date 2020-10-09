require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
    @movie = Movie.create(title: "This is title", description: "This is description", src: "This is source url")
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie_url: 'https://www.youtube.com/watch?v=60ItHLz5WEA' }
    end

    assert_redirected_to movies_url
  end
end
