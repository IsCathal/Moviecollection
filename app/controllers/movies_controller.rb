class MoviesController < ApplicationController
  before_action :set_movie, only: %i[edit update]

  def index
    @movies = Movie.all
  end

  def new
    @genres = Genre.all
    @movie = Movie.new
  end

  def edit; end

  def update
    if @movie.update(update_movie_params)
      flash[:notice] = "Movie '#{@movie.title}' views updated successfully!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie was successfully created'
      redirect_to root_path
    else
      flash[:notice] = 'There was an error'
      render 'new'
    end
  end
end

def movie_params
  params.require(:movie).permit(:title, :director, :release_year, genre_ids: [])
end

def update_movie_params
  params.require(:movie).permit(:view_count)
end

def set_movie
  @movie = Movie.find(params[:id])
end
