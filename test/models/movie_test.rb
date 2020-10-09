require 'test_helper'
require 'pry'

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.new(title: "This is title", description: "This is description", src: "This is source url")
  end

  test "Movie should be valid" do
    assert @movie.valid?
  end

  test "title should be present" do
    @movie.title = ""
    assert_not @movie.valid?
  end

  test "description should be present" do
    @movie.description = ""
    assert_not @movie.valid?
  end

  test "src should be present" do
    @movie.src = ""
    assert_not @movie.valid?
  end
end
