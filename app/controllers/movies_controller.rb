class MoviesController < ApplicationController
  def show; end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.all
  end

  def edit; end

  def update; end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      # ADD MOVIE HERE
      flash[:notice] = 'Movie was successfully created'
      redirect_to root_path
    else
      flash[:notice] = 'There was an error'
      render 'new'
    end
  end
end

def movie_params
  params.require(:movie).permit(:title, :director, :release_year, :genres)
end
