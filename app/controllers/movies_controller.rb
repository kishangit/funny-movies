class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @movies = Movie.all.order('created_at desc')
  end

  def new 
  end

  def create
    # Movie.all.map(&:destroy)
    video = VideoInfo.new(params[:movie_url])
    movie = Movie.new(
                      title: video.title, description: video.description,
                      src: video.embed_url, video_created_at: video.date
                    )
    if movie.valid?
      movie.save
      redirect_to movies_path
    end
  end
end