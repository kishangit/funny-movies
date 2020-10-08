class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    
  end
  
  def create
    binding.pry
    # Movie.all.map(&:destroy)
    video = VideoInfo.new(params[:movie_url])
    movie = Movie.new(title: video.title, description: video.description, src: video.embed_url)
    movie.valid?
    movie.save
    redirect_to movies_path
  end
  
end