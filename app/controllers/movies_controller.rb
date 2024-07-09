class MoviesController < ApplicationController
  before_action :set_movie, only: %i[edit update]

  def show; end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.new
  end

  def update; end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      # ADD MOVIE HERE

      flash[:notice] = 'Movie was successfully created'
      redirect_to root_path
      flash[:notice] = 'Movie was successfully created'

    else
      flash[:notice] = 'There was an error'
      render 'new'
    end
  end
end

def movie_params
  params.require(:movie).permit(:title, :director)
end

def set_movie
  @movie = Movie.find(params[:id])
end
