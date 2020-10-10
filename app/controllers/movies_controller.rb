class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @movies = Movie.all.order('created_at desc')
  end

  def new
  end

  def create
    video = VideoInfo.new(params[:movie_url]) rescue nil
    if params[:movie_url].present? && video.present?
      movie = Movie.new(
                        title: video.title, description: video.description, 
                        src: video.embed_url, video_created_at: video.date
                      )
      if movie.valid?
        movie.save
        flash[:notice] = I18n.t 'movie.created'
        redirect_to movies_path
      end
    else
      flash[:alert] = I18n.t 'movie.valid_url'
      render 'new'
    end
  end
end