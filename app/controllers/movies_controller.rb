class MoviesController < ApplicationController
  before_action :set_movie, only: %i[edit update]

  def show; end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      @movie.view_count += 1
      @movie.save
      flash[:notice] = 'movie was created successfully.'
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
      flash[:notice] = 'Movie was successfully created'

    else
      flash[:notice] = 'There was an error'
      render 'new'
    end
  end
end

def movie_params
  params.require(:movie).permit(:title, :director, :release_year, :genres)
end

def set_movie
  @movie = Movie.find(params[:id])
end
