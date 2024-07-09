class MoviesController < ApplicationController
  def show; end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def update; end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      # ADD MOVIE HERE
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
